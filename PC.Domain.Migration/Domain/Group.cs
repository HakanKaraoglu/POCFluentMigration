using FluentMigrator;
using PC.Domain.Migration.Version;

namespace PC.Domain.Migration.Domain
{
    [VersionMigration(MigrationVersion.V196, 01)]
    public class Group : FluentMigrator.Migration
    {
        public override void Up()
        {
            Create.Table("Group")
                .WithColumn("Group_Id").AsInt32().NotNullable().PrimaryKey().Identity()
                .WithColumn("Group_Name").AsString(255).NotNullable();


        }

        public override void Down()
        {
            Delete.Table("Group");
        }
    }
}
