
import '../../../../imports.dart';

class FAQsPage extends StatelessWidget {
  const FAQsPage({super.key});

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
                  CustomFAQHeader(title: AppLocalizations.of(context)!.faqs),
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
                  height05,
                  Card(
                    elevation: 3,
                    child: Container(
                      color: whiteColor,
                      width: double.infinity,
                      padding: padding16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.termsAndConditions,
                            style: tsRegularBold,
                          ),
                          height05,
                          Consumer<TermsAndServicesProvider>(
                            builder: (BuildContext context, provider, child) {
                              if (provider.tcData.length > 7 &&
                                  provider.tcData[7].desc != null) {
                                // LegalModel? terms = provider.legalModel;
                                var terms = provider.tcData[7].desc ?? '';
                                var termData =
                                    provider.extractTextFromHtml(terms);
                                return Text(
                                  termData.trim(),
                                  style: tsRegular,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                );
                              } else {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const TermsAndConditions(),
                                    ),
                                  );
                                },
                                child: Text(
                                  AppLocalizations.of(context)!.seeMmore,
                                  style: tsSmallBold,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  height10,
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
                          AppLocalizations.of(context)!.viewAll,
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
                                        style: tsSmallGrey,
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
