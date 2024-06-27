/*
See the License.txt file for this sample’s licensing information.
*/

import SwiftUI
import SwiftData

struct CameraView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @Query var user: [User]
    @Query var challenges: [Challenge]
    @StateObject private var model = DataModel()
 
    @State private var showingBottomSheet = false
    
    @State private var sizegeom: CGFloat = 0.0
    @State private var animatedGeom: CGFloat = 0.0
    
    private static let barHeightFactor = 0.15
    
    
    var body: some View {
        
        NavigationStack {
            GeometryReader { geometry in
                ViewfinderView(image:  $model.viewfinderImage )
                    .overlay(alignment: .top) {
                        Color.black
                            .opacity(0.75)
                            .frame(height: geometry.size.height * Self.barHeightFactor)
                    }
                    .overlay(alignment: .bottom) {
                        
//                            .frame(height: geometry.size.height * Self.barHeightFactor)
//                            .background(.black.opacity(0.75))
                    }
                    .overlay(alignment: .center)  {
                        Color.clear
                            .frame(height: geometry.size.height * (1 - (Self.barHeightFactor * 2)))
                            .accessibilityElement()
                            .accessibilityLabel("View Finder")
                            .accessibilityAddTraits([.isImage])
                    }
                    .background(.black)
            }
            .task {
                await model.camera.start()
            }
            .navigationTitle("Camera")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
            .ignoresSafeArea()
            .statusBar(hidden: true)
            .onAppear{
                showingBottomSheet = true
            }
            .sheet(isPresented: $showingBottomSheet) {
                VStack(alignment: .leading){
                    
                    
                    if model.isWaitingForAPI{
                        HStack() {
                            Spacer()
                            ProgressView()
                                .padding(.top, 45)
                                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                                .controlSize(.extraLarge)
                                .padding(.bottom, 10)
                            Spacer()
                        }
                    }else{
                        if animatedGeom < 490.0{
                            buttonsView()
                                .padding(.top, 35)
                                //.opacity((1.0 - (animatedGeom/500.0)))
                                .transition(.opacity)
                        }
                    
                    }
                    HStack{
                        Spacer()
                        Text("\(model.analysis?.items[0].food[0].food_info.display_name ?? "")")
                            .padding(.top, 35)
                            .font(.system(size: 30,weight: .medium, design: .rounded))
                        Spacer()
                    }
                    Text("Calories")
                    HStack{
                        Text("\(model.calories, specifier: "%.1f")")
                            .font(.system(size: 70,weight: .medium, design: .rounded))
                            .foregroundStyle(.orange)
                        Text("Cals")
                    }
                    
                    Text("Fat")
                    TextField("Carbs in grams", text: $model.textInput1)
                        .frame(height: 55)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding([.horizontal], 10)
                        .cornerRadius(16)
                        .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray))
                        .onChange(of: model.textInput1) { oldValue, newValue in
                            if let n = NumberFormatter().number(from: newValue) {
                                model.fat = CGFloat(truncating: n)
                            }
                            model.updateCalories()
                        }

                    Text("Carbohydrate")
                    TextField("Enter text 2", text: $model.textInput2)
                        .frame(height: 55)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding([.horizontal], 10)
                        .cornerRadius(16)
                        .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray))
                        .onChange(of: model.textInput2) { oldValue, newValue in
                            if let n = NumberFormatter().number(from: newValue) {
                                model.carbo = CGFloat(truncating: n)
                            }
                            model.updateCalories()
                        }

                    Text("Protein")
                    TextField("Enter text 3", text: $model.textInput3)
                        .frame(height: 55)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding([.horizontal], 10)
                        .cornerRadius(16)
                        .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray))
                        .onChange(of: model.textInput3) { oldValue, newValue in
                            if let n = NumberFormatter().number(from: newValue) {
                                model.protein = CGFloat(truncating: n)
                            }
                            model.updateCalories()
                        }
                    
                    
                    
                    Button(action: {
                        // Handle submit action here
                        print("Submitted: \(model.textInput1), \(model.textInput2), \(model.textInput3)")
                        print("\(user[0].dailyNutrition.last?.calories)")
                        user[0].dailyNutrition.last?.calories += Float(model.calories)
                        user[0].dailyNutrition.last?.carbohydrates += Float(model.carbo)
                        user[0].dailyNutrition.last?.fat += Float(model.fat)
                        user[0].dailyNutrition.last?.protein += Float(model.protein)
                        print("\(user[0].dailyNutrition.last?.calories)")
                        if let curFoodInfo: FoodInfo = model.analysis?.items[0].food[0].food_info{
                            print("CHECKING CHALLENGES")
                            challenges.forEach { challenge in
                                challenge.validate(foodInfo: curFoodInfo, inputTime: Date.now)
                            }
                        }
                        
                        showingBottomSheet = false
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Submit")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.top)
                    
                    
                    
                }
                .containerRelativeFrame([.vertical], alignment: .top)
                .padding(.horizontal, 20)
                .interactiveDismissDisabled()
                .presentationDetents([.small, .open], selection: $model.selectedDetent)
                .presentationBackgroundInteraction(
                    .enabled(upThrough: .medium)
                )
                .background(GeometryReader { geometry in
                    Color.clear
                        .onChange(of: geometry.size.height, { oldValue, newValue in
                            withAnimation {
                                animatedGeom = newValue
                                
                            }
                            sizegeom = newValue
                        })
                })
                        
            }
        }
    }
    
    private func buttonsView() -> some View {
        HStack() {
            Button {
                showingBottomSheet = false
                presentationMode.wrappedValue.dismiss()
            } label: {
                Label("Back to Home", systemImage: "arrow.triangle.2.circlepath")
                    .font(.system(size: 36, weight: .bold))
                    .foregroundColor(.orange)
            }
            Spacer()
            Button {
                model.isWaitingForAPI = true
                model.camera.takePhoto()
            } label: {
                Label {
                    Text("Take Photo")
                } icon: {
                    ZStack {
                        Circle()
                            .strokeBorder(.orange, lineWidth: 3)
                            .frame(width: 62, height: 62)
                        Circle()
                            .fill(.orange)
                            .frame(width: 50, height: 50)
                    }
                }
            }
            Spacer()
            Button {
                model.camera.switchCaptureDevice()
            } label: {
                Label("Switch Camera", systemImage: "arrow.triangle.2.circlepath")
                    .font(.system(size: 36, weight: .bold))
                    .foregroundColor(.orange)
            }
        }
        .buttonStyle(.plain)
        .labelStyle(.iconOnly)
        .padding(.horizontal, 30)
    }
    
}
