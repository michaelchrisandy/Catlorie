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
        Badge(name: "Hat 1", desc: "A cool hat", image: "hatpic", category: .hat),
        Badge(name: "Tree 1", desc: "A tree badge", image: "treepic", category: .tree),
        Badge(name: "Necklace 1", desc: "A nice necklace", image: "necklacepic", category: .necklace),
        Badge(name: "Toy 1", desc: "A fun toy", image: "toypic", category: .toy),
        Badge(name: "Food 1", desc: "A food badge", image: "foodpic", category: .food)
    ]
    
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
                                ZStack {
                                    Circle()
                                        .fill(selectedBadge == badge ? Color.white : Color.gray.opacity(0.2))
                                        .frame(width: 90)
                                        .overlay(
                                            Circle()
                                                .stroke(selectedBadge == badge ? Color.orange : Color.clear, lineWidth: 4)
                                        )
                                    Image(badge.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 60)
                                }
                                .onTapGesture {
                                    selectedBadge = badge
                                }
                            }
                        }
                    }
                    
                    CustomButton(text: "Wear This")
                        .padding(.top, 20)
                }
                Spacer()
            }
            .padding()
            .padding(.horizontal, 20)
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
