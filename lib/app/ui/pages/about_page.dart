import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/management_controller.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final managementController = Get.put(ManagementController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('About GPI'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Hero Section
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                image: const DecorationImage(
                  image: AssetImage('assets/images/gpi_building.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black26,
                    BlendMode.darken,
                  ),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Greenland Polytechnic Institute',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Excellence in Technical Education',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            
            // Content Sections
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSection(
                    context,
                    'About Us',
                    'Greenland Polytechnic is the last addition to the growing ventures of Greenland Group, a leading business house of Bangladesh. This addition is in keeping with the promise and commitment of Greenland Group management to bring about change and growth through technological advancement. This institute is now well poised to meet the ever increasing need of the country for mastering technical and technological knowhow which is recognized as the key to our economic growth.\n\n'
                    'It has been a fitting addition to other two technical training institutes namely Greenland Training Centre Ltd. and Greenland Technical Institute under the roof of Greenland Academic Complex located in Amulia, 10 kilometers from the heart of Dhaka city. Greenland Polytechnic has added new impetus to Greenland management\'s quest for turning vast human resource potential of the country into technically skilled manpower for fulfilling the need of domestic as well as international job market.',
                  ),
                  
                  _buildSection(
                    context,
                    'Our Management',
                    '',
                  ),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: Obx(() {
                      if (managementController.isLoading.value) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (managementController.managementList.isEmpty) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.people_outline,
                                size: 64,
                                color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'No management members found',
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface
                                          .withOpacity(0.5),
                                    ),
                              ),
                            ],
                          ),
                        );
                      }

                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: managementController.managementList.length,
                        itemBuilder: (context, index) {
                          final member = managementController.managementList[index];
                          return Card(
                            margin: const EdgeInsets.only(bottom: 16),
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: IntrinsicHeight(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  if (member.imageUrl != null)
                                    ClipRRect(
                                      borderRadius: const BorderRadius.horizontal(
                                        left: Radius.circular(16),
                                      ),
                                      child: SizedBox(
                                        width: 160,
                                        child: Image.network(
                                          member.imageUrl!,
                                          fit: BoxFit.cover,
                                          errorBuilder: (context, error, stackTrace) {
                                            return Container(
                                              color: Theme.of(context).colorScheme.surfaceVariant,
                                              child: const Icon(Icons.person, size: 64),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            member.name,
                                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            member.position,
                                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                                  color: Theme.of(context).colorScheme.primary,
                                                ),
                                          ),
                                          const SizedBox(height: 12),
                                          Text(
                                            member.bio,
                                            style: Theme.of(context).textTheme.bodyLarge,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }),
                  ),
                  
                  _buildSection(
                    context,
                    'Our Vision',
                    'To be the recognized institute in the national and international arena for contributing in the development of highly skilled, employable graduates and to be known as the valuable resource for industry and society for developing human resources with required skills.',
                  ),
                  
                  _buildSection(
                    context,
                    'Our Mission',
                    'We want to contribute to national economy through:\n'
                    '• Developing Technically Skilled Human Resources\n'
                    '• Creating Entrepreneurs\n'
                    '• Ensuring competency among every successful student\n'
                    '• Serving the Industries through Developing Human Resources with required skills',
                  ),
                  
                  _buildSection(
                    context,
                    'Departments',
                    '• Civil Technology\n'
                    '• Computer Science & Technology\n'
                    '• Electrical Technology\n'
                    '• Mechanical Technology\n'
                    '• Automobile Technology',
                  ),
                  
                  _buildSection(
                    context,
                    'Facilities',
                    '• Modern Computer Labs\n'
                    '• Well-equipped Workshops\n'
                    '• Digital Library\n'
                    '• Smart Classrooms\n'
                    '• Sports Facilities',
                  ),

                  // Contact Card
                  Card(
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Contact Us',
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                          const SizedBox(height: 16),
                          _buildContactItem(
                            context,
                            Icons.location_on_outlined,
                            'Address',
                            'Amulia Model Town, Demra, Dhaka-1360',
                          ),
                          const SizedBox(height: 12),
                          _buildContactItem(
                            context,
                            Icons.phone_outlined,
                            'Phone',
                            ' +8801709990891 \n +8801709990907 \n +8801709990860 \n +8801709990861',
                          ),
                          const SizedBox(height: 12),
                          _buildContactItem(
                            context,
                            Icons.email_outlined,
                            'Email',
                            'principal@glandgroup.com',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  height: 1.5,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem(
    BuildContext context,
    IconData icon,
    String title,
    String content,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 24,
          color: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                content,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ],
    );
  }
} 