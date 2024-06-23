import SwiftUI
import SwiftData

struct BadgesView: View {
    
    //    @Query var user: [User]
    //    @Query var badges: [Badge]
    //    @Query var cat: [Cat]
    let rows = [GridItem(.fixed(80))]
    @State private var currentCategory: BadgeCategory = .hat
    @State private var selectedBadge: Badge? = nil
    
    
    private var allBadges: [Badge] = [
        Badge(name: "Hat 1", desc: "A cool hat", image: "hatpic", category: .hat, price: 10),
        Badge(name: "Hat 2", desc: "A cool hat", image: "hat", category: .hat, price: 10),
        Badge(name: "Hat 3", desc: "A cool hat", image: "party-hat", category: .hat, price: 10),
        Badge(name: "Tree 1", desc: "A tree badge", image: "treepic", category: .tree, price: 10),
        Badge(name: "Necklace 1", desc: "A nice necklace", image: "necklacepic", category: .necklace, price: 10),
        Badge(name: "Toy 1", desc: "A fun toy", image: "toypic", category: .toy, price: 10),
        Badge(name: "Food 1", desc: "A food badge", image: "foodpic", category: .food, price: 10)
    ]
    
    @State private var cat = Cat(name: "Hose", image: "cat_fit_normal", weight: 20)
    
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
                    Image(cat.image ?? "cat_fit_normal")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200)
                        .offset(x: 20)
                        .padding(.vertical, 50)
                    
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
                                let isUnlocked = cat.badges.contains(where: { $0.id == badge.id })
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
                    
                    CustomButton(text: buttonText)
                        .padding(.top, 20)
                }
                Spacer()
            }
            .padding()
            .padding(.horizontal, 20)
        }
    }
    
    private var buttonText: String {
        guard let selectedBadge = selectedBadge else { return "Select a Badge" }
        return cat.badges.contains(where: { $0.id == selectedBadge.id }) ? "Wear This" : "Buy With \(selectedBadge.price) Coins"
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
        return allBadges.filter { $0.category == currentCategory }
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
