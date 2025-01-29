import '../../../../../imports.dart';

class AddNewFAQ extends StatelessWidget {
  const AddNewFAQ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: padding10,
          child: Consumer<FAQProvider>(
            builder: (BuildContext context, provider, Widget? child) {
              List<FaqModel> faqList = provider.faqList;
              return Column(
                children: [
                  CustomHeader(title: AppLocalizations.of(context)!.addNewFaq),
                  height20,
                  Padding(
                    padding: padding5,
                    child: TextFormField(
                      onChanged: (value) {
                        provider.search(value);
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: greyColor),
                        ),
                        hintText: AppLocalizations.of(context)!.search,
                        suffixIcon: IconButton(
                          onPressed: () {
                            provider.search('');
                          },
                          icon: const Icon(Icons.search),
                        ),
                      ),
                    ),
                  ),
                  height25,
                  Padding(
                    padding: padding10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.topQuestions,
                          style: tsRegularBold,
                        ),
                        Text(
                          AppLocalizations.of(context)!.addAnswer,
                          style: tsRegularUnderline,
                        ),
                      ],
                    ),
                  ),
                  height10,
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return height10;
                      },
                      itemCount: faqList.length,
                      itemBuilder: (BuildContext context, int index) {
                        FaqModel faq = faqList[index];
                        return Card(
                          color: whiteColor,
                          elevation: 4,
                          child: Padding(
                            padding: padding8,
                            child: ExpansionTile(
                              title: Text(
                                faq.heading,
                                style: tsRegularBold,
                              ),
                              children: [
                                Padding(
                                  padding: horizontalPadding15,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        faq.faq,
                                        style: tsRegular,
                                      ),
                                      height15,
                                      Text(
                                        AppLocalizations.of(context)!
                                            .stillHavingIssues,
                                        style: tsRegularBold,
                                      ),
                                      height15,
                                      Row(
                                        children: [
                                          Image.asset(
                                            chatUs,
                                            scale: 3.5,
                                          ),
                                          width10,
                                          Text(
                                            AppLocalizations.of(context)!
                                                .chatWithUs,
                                            style: tsSmallBold,
                                          ),
                                        ],
                                      ),
                                      height10,
                                      Row(
                                        children: [
                                          Image.asset(
                                            callUs,
                                            scale: 3.5,
                                          ),
                                          width10,
                                          Text(
                                            AppLocalizations.of(context)!
                                                .callUs,
                                            style: tsSmallBold,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                height10,
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
