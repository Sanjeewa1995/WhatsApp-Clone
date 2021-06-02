import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:whats_app_clone/features/chat/presentation/widgets/attachment_popup_card.dart';

class ChatFormField extends StatefulWidget {
  const ChatFormField() : super();

  @override
  _ChatFormFieldState createState() => _ChatFormFieldState();
}

class _ChatFormFieldState extends State<ChatFormField> {
  bool showEmoji = false;
  bool showAttachment = false;
  FocusNode focusNode = FocusNode();
  TextEditingController _controller = TextEditingController();

  Widget _getEmoji() {
    return Container(
      height: 250,
      child: EmojiPicker(
          onEmojiSelected: (Category category, Emoji emoji) {
            setState(() {
              _controller.text = _controller.text + emoji.emoji;
            });
          },
          onBackspacePressed: () {
            setState(() {
              _controller
                ..text = _controller.text.characters.skipLast(1).toString();
            });
          },
          config: const Config(
            columns: 7,
            emojiSizeMax: 25.0,
            verticalSpacing: 0,
            horizontalSpacing: 0,
            initCategory: Category.RECENT,
            bgColor: Color(0xFFF2F2F2),
            indicatorColor: Colors.blue,
            iconColor: Colors.grey,
            iconColorSelected: Colors.blue,
            progressIndicatorColor: Colors.blue,
            backspaceColor: Colors.blue,
            showRecentsTab: true,
            recentsLimit: 28,
            noRecentsText: 'No Recents',
            noRecentsStyle: TextStyle(fontSize: 20, color: Colors.black26),
            categoryIcons: CategoryIcons(),
            buttonMode: ButtonMode.MATERIAL,
          )),
    );
  }

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          showEmoji = false;
        });
      }
      if (showAttachment && focusNode.hasFocus) {
        setState(() {
          showAttachment = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/chat_background.png'),
          fit: BoxFit.cover,
        )),
      child: WillPopScope(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (showAttachment && !focusNode.hasFocus) AttachmentPopUpCard(),
              Row(
                children: [
                  Container(
        width: MediaQuery.of(context).size.width - 60,
        child: Card(
          margin: EdgeInsets.only(left: 6, right: 2, bottom: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: TextFormField(
            controller: _controller,
            focusNode: focusNode,
            textAlignVertical: TextAlignVertical.center,
            keyboardType: TextInputType.multiline,
            maxLines: 5,
            minLines: 1,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Type a message',
              hintStyle: TextStyle(fontSize: 15),
              prefixIcon: IconButton(
                icon: Icon(
                  Icons.emoji_emotions_outlined,
                  size: 30,
                  color: Colors.grey,
                ),
                onPressed: () {
                  focusNode.unfocus();
                  focusNode.canRequestFocus = false;
                  showAttachment = false;
                  setState(() {
                    showEmoji = !showEmoji;
                  });
                },
              ),
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      focusNode.unfocus();
                      focusNode.canRequestFocus = false;
                      showEmoji = false;
                      setState(() {
                        showAttachment = !showAttachment;
                      });
                    },
                    icon: Icon(
                      Icons.attach_file,
                      color: Colors.blueGrey,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.camera_alt,
                      color: Colors.blueGrey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
                  ),
                  Padding(
        padding: const EdgeInsets.only(bottom: 8, right: 4, left: 4),
        child: CircleAvatar(
          radius: 25,
          backgroundColor: Color(0xff128C7E),
          child: IconButton(
            icon: Icon(
              Icons.mic,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ),
                  )
                ],
              ),
              showEmoji ? _getEmoji() : Container(),
            ],
          ),
        onWillPop: () {
          if (showEmoji) {
            setState(() {
              showEmoji = false;
            });
          } else {
            Navigator.pop(context);
          }
          return Future.value(false);
        },
      ),
    );
  }
}
