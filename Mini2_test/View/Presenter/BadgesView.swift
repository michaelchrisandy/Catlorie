import SwiftUI
import SwiftData

struct BadgesView: View {
    
//    @Query var user: [User]
//    @Query var badges: [Badge]
//    @Query var cat: [Cat]
    let rows = [GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack{
                    Spacer()
                    ToolBarIcon(text: "100", image: "dollarsign.circle", color: "green")
                }
                Text("Badges")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(5)
                
                ZStack {
                    Image("cat_fit_normal")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200)
                        .offset(x: 20)
                        .padding(.vertical, 60)

                    
    //                if let cat = user.first?.cat {
    //                    ForEach(cat.badges) { badge in
    //                        if badge.category == .hat {
    //                            Image(badge.image)
    //                                .resizable()
    //                                .scaledToFit()
    //                                .frame(width: 120)
    //                                .position(x: 185, y: 32)
    //                        }
    //                    }
    //                }
                }
                
                VStack {
                    Text("Accessory")
                        .font(.title)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    ScrollView(.horizontal) {
                        LazyHGrid(rows: rows, spacing: 20) {
                            ForEach(0..<4) { badge in
                                ZStack {
                                    Circle()
                                        .fill(.gray).opacity(0.2)
                                        .frame(width: 90)
                                    Image("hatpic")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 60)
                                }
        //                        .onTapGesture {
        //                            assignBadgeToCat(badge)
        //                            print("after assigning: \(user[0].cat.badges.count)")
        //                        }
                            }
                        }
                    }
                }
                Spacer()
            }
            .padding()
            .padding(.horizontal, 20)
        }
    }
    
//    private func assignBadgeToCat(_ badge: Badge) {
//        if let user = user.first {
//            if let index = user.cat.badges.firstIndex(where: { $0.category == badge.category }) {
//                user.cat.badges[index].isUsed = false
//                user.cat.badges.remove(at: index)
//                user.cat.badges.append(badge)
//                badge.isUsed = true
//                print("Badge replaced on cat")
//            } else if !badge.isUsed {
//                user.cat.badges.append(badge)
//                badge.isUsed = true
//                print("Badge assigned to cat")
//            } else {
//                print("Badge already assigned to cat")
//            }
//        }
//    }
    
}

#Preview {
    BadgesView()
}
