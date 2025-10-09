import 'package:flutter/material.dart';

class CompanyCreationScreen extends StatefulWidget {
  const CompanyCreationScreen({super.key});

  @override
  State<CompanyCreationScreen> createState() => _CompanyCreationScreenState();
}

class _CompanyCreationScreenState extends State<CompanyCreationScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FC),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Company Creation",
          style: TextStyle(
            color: Color(0xFF3E63DD),
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
      ),
      body: Column(
        children: [
          // ─── Tab Bar ──────────────────────────────────────────────
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
            ),
            child: TabBar(
              controller: _tabController,
              labelColor: const Color(0xFF3E63DD),
              unselectedLabelColor: Colors.grey,
              indicatorColor: const Color(0xFF3E63DD),
              tabs: const [
                Tab(text: "Company Info"),
                Tab(text: "Voucher Type"),
                Tab(text: "Integration Type"),
              ],
            ),
          ),

          // ─── Tab Views ─────────────────────────────────────────────
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // ────────────── Company Info Tab ──────────────
                CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 20),
                        child: Column(
                          children: [
                            // Company Name
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: "Company Name",
                                  hintText: "Enter Company Name",
                                  labelStyle: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF6A6A8B)),
                                  hintStyle:
                                      const TextStyle(color: Colors.grey),
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                        color: Color(0xFFE6E6EF)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                        color: Color(0xFF3E63DD)),
                                  ),
                                ),
                              ),
                            ),

                            // Display Name
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: "Display Name",
                                  hintText: "Enter display name",
                                  labelStyle: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF6A6A8B)),
                                  hintStyle:
                                      const TextStyle(color: Colors.grey),
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                        color: Color(0xFFE6E6EF)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                        color: Color(0xFF3E63DD)),
                                  ),
                                ),
                              ),
                            ),

                            // Address 1
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: "Address 1",
                                  hintText: "Enter address",
                                  labelStyle: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF6A6A8B)),
                                  hintStyle:
                                      const TextStyle(color: Colors.grey),
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                        color: Color(0xFFE6E6EF)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                        color: Color(0xFF3E63DD)),
                                  ),
                                ),
                              ),
                            ),

                            // Address 2
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: "Address 2",
                                  hintText: "Enter address",
                                  labelStyle: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF6A6A8B)),
                                  hintStyle:
                                      const TextStyle(color: Colors.grey),
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                        color: Color(0xFFE6E6EF)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                        color: Color(0xFF3E63DD)),
                                  ),
                                ),
                              ),
                            ),

                            // Address 3
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: "Address 3",
                                  hintText: "Enter address",
                                  labelStyle: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF6A6A8B)),
                                  hintStyle:
                                      const TextStyle(color: Colors.grey),
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                        color: Color(0xFFE6E6EF)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                        color: Color(0xFF3E63DD)),
                                  ),
                                ),
                              ),
                            ),

                            // Pincode
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: "Pincode",
                                  hintText: "Enter Pin code",
                                  labelStyle: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF6A6A8B)),
                                  hintStyle:
                                      const TextStyle(color: Colors.grey),
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                        color: Color(0xFFE6E6EF)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                        color: Color(0xFF3E63DD)),
                                  ),
                                ),
                              ),
                            ),

                            // Country & State in a Row
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 16),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        labelText: "Country",
                                        hintText: "Enter Country",
                                        labelStyle: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF6A6A8B)),
                                        hintStyle: const TextStyle(
                                            color: Colors.grey),
                                        filled: true,
                                        fillColor: Colors.white,
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: const BorderSide(
                                              color: Color(0xFFE6E6EF)),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: const BorderSide(
                                              color: Color(0xFF3E63DD)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 16),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        labelText: "State",
                                        hintText: "Enter State",
                                        labelStyle: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF6A6A8B)),
                                        hintStyle: const TextStyle(
                                            color: Colors.grey),
                                        filled: true,
                                        fillColor: Colors.white,
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: const BorderSide(
                                              color: Color(0xFFE6E6EF)),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: const BorderSide(
                                              color: Color(0xFF3E63DD)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            // Registration Type
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: "Registration Type",
                                  hintText: "Enter registration type",
                                  labelStyle: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF6A6A8B)),
                                  hintStyle:
                                      const TextStyle(color: Colors.grey),
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                        color: Color(0xFFE6E6EF)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                        color: Color(0xFF3E63DD)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                // ────────────── Voucher Type Tab ──────────────
                CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Text(
                            "Voucher Type Content",
                            style:
                                TextStyle(fontSize: 16, color: Colors.grey[600]),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                // ────────────── Integration Type Tab ──────────────
                CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Text(
                            "Integration Type Content",
                            style:
                                TextStyle(fontSize: 16, color: Colors.grey[600]),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
