import SwiftUI
import OOPLibrary
struct EditItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var editItemPresented: Bool
    @Binding var itemId: String

    var body: some View {
        VStack {
            Text("Edit Page")
                .font(.system(size: 34))
                .bold()
                .padding(.top, 50)

            Form {
                // title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(PlainTextFieldStyle())

                // due date
                DatePicker("Due date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())

                // button
                ButtonView(title: "Update", background: .purple) {
                    if viewModel.canSave {
                        viewModel.update(id: itemId) // Используйте itemId здесь
                        editItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("ALARM!!!!"),
                      message: Text("Please fill in all fields and select a due date that is today or newer."))
            }
        }
    }
}

#Preview {
    EditItemView(editItemPresented: .constant(true), itemId: .constant("E7D92EA6-0C5E-4EF9-9D26-FA858B141E5B"))
}
