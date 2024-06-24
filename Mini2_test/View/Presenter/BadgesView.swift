import SwiftUI
import SwiftData

struct BadgesView: View {
    
    @Query var user: [User]
    @Query var badges: [Badge]
    @Query var cat: [Cat]
    let rows = [GridItem(.fixed(80))]
    
    @State private var currentCategory: BadgeCategory = .Accessories
    @State private var selectedBadge: Badge? = nil
    
    private var buttonText: String {
        guard let selectedBadge = selectedBadge else { return "Select a Badge" }
        return selectedBadge.isUnlocked ? "Wear This" : "Buy With \(selectedBadge.price) Coins"
    }
    
    private var customAlertView: some View {
        CustomAlertView(title: "Not Enough Coins!", message: alertMessage, buttonText: "OK") {
            showAlert = false
        }
    }
    
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack{
                    Spacer()
                    ToolBarIcon(text: "\(user[0].coin)", image: "dollarsign.circle", color: "green")
                }
                Text("Badges")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(5)
                
                if let cat = user.first?.cat {
                    CatImageView(cat: cat)
                }
                
                VStack {
                    HStack {
                        Button(action: {
                            previousCategory()
                        }) {
                            Image(systemName: "chevron.left")
                                .padding()
                        }
                        
                        Text(currentCategory.rawValue.capitalized)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Button(action: {
                            nextCategory()
                        }) {
                            Image(systemName: "chevron.right")
                                .padding()
                        }
                    }
                    ScrollView(.horizontal) {
                        LazyHGrid(rows: rows, spacing: 20) {
                            ForEach(filteredBadges()) { badge in
                                let isUnlocked = badge.isUnlocked
                                ZStack {
                                    Circle()
                                        .fill(selectedBadge == badge && isUnlocked == true ? Color.white : Color.gray.opacity(0.2))
                                        .frame(width: 90)
                                        .overlay(
                                            Circle()
                                                .stroke(selectedBadge == badge ? Color.orange : Color.clear, lineWidth: 4)
                                        )
                                    
                                    Image(badge.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 60)
                                        .opacity(isUnlocked ? 1.0 : 0.4)
                                    
                                    if !isUnlocked {
                                        Image(systemName: "lock.fill")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 20)
                                            .foregroundColor(.gray)
                                    }
                                }
                                .onTapGesture {
                                    selectedBadge = badge
                                }
                            }
                        }
                    }
                    
                    Button{
                        handleBadgeButton()
                    }label: {
                        CustomButton(text: buttonText)
                            .padding(.top, 20)
                    }
                    
                }
                Spacer()
            }
            .padding()
            .padding(.horizontal, 20)
            .background(
                Color.black.opacity(showAlert ? 0.3 : 0)
                    .edgesIgnoringSafeArea(.all)
            )
            .overlay(
                showAlert ? AnyView(customAlertView) : AnyView(EmptyView())
            )
        }
    }
    
    private func handleBadgeButton(){
        guard let selectedBadge = selectedBadge else
        { return }
        
        if selectedBadge.isUnlocked{
            assignBadgeToCat(selectedBadge)
        } else {
            unlockBadge(badge: selectedBadge)
        }
    }
    
    private func unlockBadge(badge: Badge){
        if user[0].coin >= badge.price {
            badge.isUnlocked = true
            user[0].coin -= badge.price
        } else {
            alertMessage = "You need \(badge.price - user[0].coin) more coins to buy this badge."
            showAlert = true
        }
    }
    
    private func previousCategory() {
        if let currentIndex = BadgeCategory.allCases.firstIndex(of: currentCategory) {
            let previousIndex = (currentIndex - 1 + BadgeCategory.allCases.count) % BadgeCategory.allCases.count
            currentCategory = BadgeCategory.allCases[previousIndex]
        }
    }
    
    private func nextCategory() {
        if let currentIndex = BadgeCategory.allCases.firstIndex(of: currentCategory) {
            let nextIndex = (currentIndex + 1) % BadgeCategory.allCases.count
            currentCategory = BadgeCategory.allCases[nextIndex]
        }
    }
    
    private func filteredBadges() -> [Badge] {
        return badges.filter { $0.category == currentCategory }
    }
    
    private func assignBadgeToCat(_ badge: Badge) {
        if let user = user.first {
            if let index = user.cat.badges.firstIndex(where: { $0.category == badge.category }) {
                user.cat.badges[index].isUsed = false
                user.cat.badges.remove(at: index)
                user.cat.badges.append(badge)
                badge.isUsed = true
                print("Badge replaced on cat")
            } else if !badge.isUsed {
                user.cat.badges.append(badge)
                badge.isUsed = true
                print("Badge assigned to cat")
            } else {
                print("Badge already assigned to cat")
            }
        }
    }
}

#Preview {
    BadgesView()
}
