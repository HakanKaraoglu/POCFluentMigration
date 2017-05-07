using FluentMigrator;
using PC.Domain.Migration.Version;

namespace PC.Domain.Migration
{
    public class VersionMigrationAttribute : MigrationAttribute
    {
        public VersionMigrationAttribute(MigrationVersion version, byte order) : this(version, order, TransactionBehavior.Default, null) { }
        public VersionMigrationAttribute(MigrationVersion version, byte order, string description) : this(version, order, TransactionBehavior.Default, description) { }
        public VersionMigrationAttribute(MigrationVersion version, byte order, TransactionBehavior transactionBehavior) : this(version, order, transactionBehavior, null) { }
        public VersionMigrationAttribute(MigrationVersion version, byte order, TransactionBehavior transactionBehavior, string description)
            : base(GetMigrationVersion(version, order), transactionBehavior, description) { }

        private static long GetMigrationVersion(MigrationVersion version, byte order) // # ushort range [0 - 65535], byte range [0 - 255]
        {
            return ((ushort)version * 1000L) + order;
        }
    }
}
