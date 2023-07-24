

import SwiftUI
import Kingfisher

struct CharacterProfileView: View {
    
    // MARK: - Properties -
    
    let character: Character
    
    // MARK: - States -
    @StateObject var viewModel = Resolver.shared.resolve(CharacterProfileViewModel.self)
    
    @ObservedObject var favorites = Favorites()

    
   // @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
         contentView
        .ignoresSafeArea()
        .clipped()
        .onAppear {
            
            Task {
                await viewModel.loadComics(forCharacter: character.id ?? 0)
            }
        }
    }
    
    // MARK: - View Sections -
    
    private var coverImageView: some View {
        CachedImageView(character.imageURL)
            .aspectRatio(2/1, contentMode: .fit)
            .cornerRadius(15)
            .frame(
                alignment: .center
            )
            .cornerRadius(15, corners: [.bottomLeft, .bottomRight,.topLeft, .topRight])
    }
    
    private var contentView: some View {
        NavigationStack{
            ScrollView{
                LazyVStack(alignment: .center) {
                    Spacer()
                    coverImageView
                    
                    Spacer()
                    
                    
                    Text(character.name ?? "")
                        .font(.system(.largeTitle, weight: .bold))
                        .padding([.bottom], 10)
                    
                    Text(character.safeDescription)
                        .font(.body)
                        .padding([.bottom], 10)
                    
                    comicsSection
                    
                }
                .padding([.leading, .bottom, .trailing,.top], 20)}.content
        }.navigationTitle("Details").navigationBarBackButtonHidden(false).toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    
            if self.favorites.contains(character.id!) {
                        self.favorites.remove(character.id!)
                          } else {
                              self.favorites.add(character.id!)
                          }
                } ){
                    HStack{
                        Image(systemName: self.favorites.contains(character.id ?? 0) ? "heart.fill" : "heart").foregroundColor(self.favorites.contains(character.id ?? 0) ? .red : .black)
                    }
                }
            }
        }
    }
    
    private var comicsSection: some View {
        BaseStateView(viewModel: viewModel,
                      successView: AnyView(VStack(alignment: .leading) {
            Text("Comics")
                .font(.system(.title2, weight: .bold))
                .padding([.bottom], 5)
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(viewModel.comics) { item in
                        ComicItemView(comic: item)
                    }
                }
            }
        }))
    }
    
}

struct CharacterProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterProfileView(character: Character.dummyCharacter())
    }
}
