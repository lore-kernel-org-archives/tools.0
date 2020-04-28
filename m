Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web12.2768.1588102182637278966
 for <tools@linux.kernel.org>;
 Tue, 28 Apr 2020 12:29:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VXoK7DBr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.160.178, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qt1-f178.google.com with SMTP id h26so18021195qtu.8
        for <tools@linux.kernel.org>; Tue, 28 Apr 2020 12:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=PFeBfZKRXajWj9JPk7/BcwROZtDEEql6ehNk8DphAEI=;
        b=VXoK7DBrRvLlVmtEZ4vAF49p6Czhf8tujgL+oA0zsWm0/wLelsCvAlpWee/8SYwpbD
         +r09d22YSff35RzqQw3Bd92r0RIjp3J//nck1tSDBmhuH0iylE1kPvQ5KVviGph/Bdu1
         Mo8lhP9rob9lieisPj5woONdfXfY4P+gtYlQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=PFeBfZKRXajWj9JPk7/BcwROZtDEEql6ehNk8DphAEI=;
        b=Pi5IpHErvkKsc07Wp5CJY93vvmguKBzdTjD0sF8fXMboTrXyCyEyJE2pkqy2PlEx1r
         ktU+PP7vRC+1BR10tMmwifSxZBTJ9iopxE+nfIwRWFEh1ypiCXa3ogX6MjCJoIY7EUMI
         0NlqrQgbIy8vrWgqGF5KTGlyeNz+z59ZeUBCt00SBvP345kHrWo6Mn7QmR7n+mNZ4HPX
         9n3KrOEmz2Tc+jjQBocoBlNdHYeNi+pxcZDJQz9hf+3PP1GrKpBpBcqqRUCN8ts69r7o
         iap+Yshp3rQtzBK3LXniereRXNMhwSc1N6y5DSei/JnixiToOqNIV1EmjWkQLzofX1Kn
         aF2w==
X-Gm-Message-State: AGi0PuaWNv76mc6MtTM7PZbTN9JXcmCoFAJ4CZxwIcEU/AWYuuKBCbFY
	N0ERoVc569yT9tm1/X9tMYKHJg==
X-Google-Smtp-Source: APiQypIW9SWgomHwVMr08dFRbsHUU5c+Mbmc9I6uzmn10HBuafGcC627vf/MumJ3GXN1rZ+37WstHA==
X-Received: by 2002:ac8:4c9d:: with SMTP id j29mr32110268qtv.297.1588102181628;
        Tue, 28 Apr 2020 12:29:41 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from i7.mricon.com (107-179-243-71.cpe.teksavvy.com. [107.179.243.71])
        by smtp.gmail.com with ESMTPSA id i56sm15111369qte.6.2020.04.28.12.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 12:29:40 -0700 (PDT)
Received: by i7.mricon.com (sSMTP sendmail emulation); Tue, 28 Apr 2020 15:29:38 -0400
Date: Tue, 28 Apr 2020 15:29:38 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: users@linux.kernel.org, tools@linux.kernel.org
Subject: What is a useful way to show changes between series?
Message-ID: <20200428192938.aue3v6kxsm47day5@chatter.i7.local>
MIME-Version: 1.0
X-Groupsio-MsgNum: 108
Content-Type: multipart/mixed; boundary="fslpnbnjtn5b2pgr"
Content-Disposition: inline

--fslpnbnjtn5b2pgr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi, all:

What would be a useful way to quickly do a "show me what changed" 
between two versions of the same patch series? Especially considering 
that:

- there may be a different number of patches in the series
- new revisions will likely be based on newer trees
- subjects/commit messages/trailers may be vastly different between two 
  series, even if the code is very similar (e.g. someone broke down a 
  single large commit into several smaller ones or vice-versa)

In my mind, the best way to approach this would be:

1. Create a single unified diff file from all patches in each series 
   (using combinediff)
2. Remove all context, leaving only -/+ lines (using interdiff -U0)
3. Remove all line numbers from @@ @@ hunks (replacing them with 0)
4. Add commit information on top of the diff

In the end, we get two summary documents that can be compared using 
regular diffing tools like vimdiff/meld/etc and actually show a fairly 
succinct "how are these two series different" view.

The goal is not to replace code review, obviously, but to give a way for 
a maintainer to do a quick sanity-check of a series they've reviewed 
before.

I ran this scenario on a random patch series that I found 
(https://lore.kernel.org/lkml/b2b9cb06-b0eb-3e94-b83a-e58467069ae2@gmail.com/) 
and attached are two summary files:

 - phy_v2.summary
 - phy_v3.summary

Here's how diffing them looks in vimdiff and meld:

 - https://mricon.com/misc/phy-summary-vimdiff-fs8.png
 - https://mricon.com/misc/phy-summary-meld-fs8.png

So, questions for you are:

1. Is this is a useful way to present an "at-a-glance" view?
2. If yes, how would you change it to be more useful?
3. If not a good approach at all, how would you recommend approaching it 
   instead?

Thanks,
-K

--fslpnbnjtn5b2pgr
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="phy_v2.summary"

[PATCH 1/3]
    From: Robert Marko <robert.marko@sartura.hr>
    Subject: net: phy: mdio: add IPQ40xx MDIO driver

    This patch adds the driver for the MDIO interface
    inside of Qualcomm IPQ40xx series SoC-s.

    Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
    Signed-off-by: Robert Marko <robert.marko@sartura.hr>
    Cc: Luka Perkov <luka.perkov@sartura.hr>

[PATCH 2/3]
    From: Robert Marko <robert.marko@sartura.hr>
    Subject: dt-bindings: add Qualcomm IPQ4019 MDIO bindings

    This patch adds the binding document for the IPQ40xx MDIO driver.

    Signed-off-by: Robert Marko <robert.marko@sartura.hr>
    Cc: Luka Perkov <luka.perkov@sartura.hr>

[PATCH 3/3]
    From: Robert Marko <robert.marko@sartura.hr>
    Subject: dts: ipq4019: add MDIO node

    This patch adds the necessary MDIO interface node
    to the Qualcomm IPQ4019 DTSI.

    Built-in QCA8337N switch is managed using it,
    and since we have a driver for it lets add it.

    Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
    Signed-off-by: Robert Marko <robert.marko@sartura.hr>
    Cc: Luka Perkov <luka.perkov@sartura.hr>

--- a/drivers/net/phy/Kconfig
+++ b/drivers/net/phy/Kconfig
@@ -0,0 +0,7 @@
+config MDIO_IPQ40XX
+	tristate "Qualcomm IPQ40xx MDIO interface"
+	depends on HAS_IOMEM && OF
+	help
+	  This driver supports the MDIO interface found in Qualcomm
+	  IPQ40xx series Soc-s.
+
--- a/drivers/net/phy/Makefile
+++ b/drivers/net/phy/Makefile
@@ -0,0 +0 @@
+obj-$(CONFIG_MDIO_IPQ40XX)	+= mdio-ipq40xx.o
--- /dev/null
+++ b/drivers/net/phy/mdio-ipq40xx.c
@@ -0,0 +0,176 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/* Copyright (c) 2015, The Linux Foundation. All rights reserved. */
+/* Copyright (c) 2020 Sartura Ltd. */
+
+#include <linux/delay.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/io.h>
+#include <linux/of_address.h>
+#include <linux/of_mdio.h>
+#include <linux/phy.h>
+#include <linux/platform_device.h>
+
+#define MDIO_CTRL_0_REG		0x40
+#define MDIO_CTRL_1_REG		0x44
+#define MDIO_CTRL_2_REG		0x48
+#define MDIO_CTRL_3_REG		0x4c
+#define MDIO_CTRL_4_REG		0x50
+#define MDIO_CTRL_4_ACCESS_BUSY		BIT(16)
+#define MDIO_CTRL_4_ACCESS_START		BIT(8)
+#define MDIO_CTRL_4_ACCESS_CODE_READ		0
+#define MDIO_CTRL_4_ACCESS_CODE_WRITE	1
+
+#define IPQ40XX_MDIO_RETRY	1000
+#define IPQ40XX_MDIO_DELAY	10
+
+struct ipq40xx_mdio_data {
+	void __iomem	*membase;
+};
+
+static int ipq40xx_mdio_wait_busy(struct mii_bus *bus)
+{
+	struct ipq40xx_mdio_data *priv = bus->priv;
+	int i;
+
+	for (i = 0; i < IPQ40XX_MDIO_RETRY; i++) {
+		unsigned int busy;
+
+		busy = readl(priv->membase + MDIO_CTRL_4_REG) &
+			MDIO_CTRL_4_ACCESS_BUSY;
+		if (!busy)
+			return 0;
+
+		/* BUSY might take to be cleard by 15~20 times of loop */
+		udelay(IPQ40XX_MDIO_DELAY);
+	}
+
+	dev_err(bus->parent, "MDIO operation timed out\n");
+
+	return -ETIMEDOUT;
+}
+
+static int ipq40xx_mdio_read(struct mii_bus *bus, int mii_id, int regnum)
+{
+	struct ipq40xx_mdio_data *priv = bus->priv;
+	int value = 0;
+	unsigned int cmd = 0;
+
+	/* Reject clause 45 */
+	if (regnum & MII_ADDR_C45)
+		return -EOPNOTSUPP;
+
+	if (ipq40xx_mdio_wait_busy(bus))
+		return -ETIMEDOUT;
+
+	/* issue the phy address and reg */
+	writel((mii_id << 8) | regnum, priv->membase + MDIO_CTRL_1_REG);
+
+	cmd = MDIO_CTRL_4_ACCESS_START | MDIO_CTRL_4_ACCESS_CODE_READ;
+
+	/* issue read command */
+	writel(cmd, priv->membase + MDIO_CTRL_4_REG);
+
+	/* Wait read complete */
+	if (ipq40xx_mdio_wait_busy(bus))
+		return -ETIMEDOUT;
+
+	/* Read data */
+	value = readl(priv->membase + MDIO_CTRL_3_REG);
+
+	return value;
+}
+
+static int ipq40xx_mdio_write(struct mii_bus *bus, int mii_id, int regnum,
+							 u16 value)
+{
+	struct ipq40xx_mdio_data *priv = bus->priv;
+	unsigned int cmd = 0;
+
+	/* Reject clause 45 */
+	if (regnum & MII_ADDR_C45)
+		return -EOPNOTSUPP;
+
+	if (ipq40xx_mdio_wait_busy(bus))
+		return -ETIMEDOUT;
+
+	/* issue the phy address and reg */
+	writel((mii_id << 8) | regnum, priv->membase + MDIO_CTRL_1_REG);
+
+	/* issue write data */
+	writel(value, priv->membase + MDIO_CTRL_2_REG);
+
+	cmd = MDIO_CTRL_4_ACCESS_START | MDIO_CTRL_4_ACCESS_CODE_WRITE;
+	/* issue write command */
+	writel(cmd, priv->membase + MDIO_CTRL_4_REG);
+
+	/* Wait write complete */
+	if (ipq40xx_mdio_wait_busy(bus))
+		return -ETIMEDOUT;
+
+	return 0;
+}
+
+static int ipq40xx_mdio_probe(struct platform_device *pdev)
+{
+	struct ipq40xx_mdio_data *priv;
+	struct mii_bus *bus;
+	int ret;
+
+	bus = devm_mdiobus_alloc_size(&pdev->dev, sizeof(*priv));
+	if (!bus)
+		return -ENOMEM;
+
+	priv = bus->priv;
+
+	priv->membase = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->membase))
+		return PTR_ERR(priv->membase);
+
+	bus->name = "ipq40xx_mdio";
+	bus->read = ipq40xx_mdio_read;
+	bus->write = ipq40xx_mdio_write;
+	bus->parent = &pdev->dev;
+	snprintf(bus->id, MII_BUS_ID_SIZE, "%s%d", pdev->name, pdev->id);
+
+	ret = of_mdiobus_register(bus, pdev->dev.of_node);
+	if (ret) {
+		dev_err(&pdev->dev, "Cannot register MDIO bus!\n");
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, bus);
+
+	return 0;
+}
+
+static int ipq40xx_mdio_remove(struct platform_device *pdev)
+{
+	struct mii_bus *bus = platform_get_drvdata(pdev);
+
+	mdiobus_unregister(bus);
+
+	return 0;
+}
+
+static const struct of_device_id ipq40xx_mdio_dt_ids[] = {
+	{ .compatible = "qcom,ipq40xx-mdio" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ipq40xx_mdio_dt_ids);
+
+static struct platform_driver ipq40xx_mdio_driver = {
+	.probe = ipq40xx_mdio_probe,
+	.remove = ipq40xx_mdio_remove,
+	.driver = {
+		.name = "ipq40xx-mdio",
+		.of_match_table = ipq40xx_mdio_dt_ids,
+	},
+};
+
+module_platform_driver(ipq40xx_mdio_driver);
+
+MODULE_DESCRIPTION("IPQ40XX MDIO interface driver");
+MODULE_AUTHOR("Qualcomm Atheros");
+MODULE_LICENSE("Dual BSD/GPL");
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/qcom,ipq40xx-mdio.yaml
@@ -0,0 +0,62 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/qcom,ipq40xx-mdio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm IPQ40xx MDIO Controller Device Tree Bindings
+
+maintainers:
+  - Robert Marko <robert.marko@sartura.hr>
+
+allOf:
+  - $ref: "mdio.yaml#"
+
+properties:
+  compatible:
+    const: qcom,ipq40xx-mdio
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+
+examples:
+  - |
+    mdio@90000 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      compatible = "qcom,ipq40xx-mdio";
+      reg = <0x90000 0x64>;
+      status = "disabled";
+
+      ethphy0: ethernet-phy@0 {
+        reg = <0>;
+      };
+
+      ethphy1: ethernet-phy@1 {
+        reg = <1>;
+      };
+
+      ethphy2: ethernet-phy@2 {
+        reg = <2>;
+      };
+
+      ethphy3: ethernet-phy@3 {
+        reg = <3>;
+      };
+
+      ethphy4: ethernet-phy@4 {
+        reg = <4>;
+      };
+    };
--- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
@@ -0,0 +0,28 @@
+		mdio: mdio@90000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "qcom,ipq40xx-mdio";
+			reg = <0x90000 0x64>;
+			status = "disabled";
+
+			ethphy0: ethernet-phy@0 {
+				reg = <0>;
+			};
+
+			ethphy1: ethernet-phy@1 {
+				reg = <1>;
+			};
+
+			ethphy2: ethernet-phy@2 {
+				reg = <2>;
+			};
+
+			ethphy3: ethernet-phy@3 {
+				reg = <3>;
+			};
+
+			ethphy4: ethernet-phy@4 {
+				reg = <4>;
+			};
+		};
+

--fslpnbnjtn5b2pgr
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="phy_v3.summary"

[PATCH 1/3]
    From: Robert Marko <robert.marko@sartura.hr>
    Subject: net: phy: mdio: add IPQ40xx MDIO driver

    This patch adds the driver for the MDIO interface
    inside of Qualcomm IPQ40xx series SoC-s.

    Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
    Signed-off-by: Robert Marko <robert.marko@sartura.hr>
    Cc: Luka Perkov <luka.perkov@sartura.hr>

[PATCH 2/3]
    From: Robert Marko <robert.marko@sartura.hr>
    Subject: dt-bindings: add Qualcomm IPQ4019 MDIO bindings

    This patch adds the binding document for the IPQ40xx MDIO driver.

    Signed-off-by: Robert Marko <robert.marko@sartura.hr>
    Cc: Luka Perkov <luka.perkov@sartura.hr>

[PATCH 3/3]
    From: Robert Marko <robert.marko@sartura.hr>
    Subject: ARM: dts: qcom: ipq4019: add MDIO node

    This patch adds the necessary MDIO interface node
    to the Qualcomm IPQ4019 DTSI.

    Built-in QCA8337N switch is managed using it,
    and since we have a driver for it lets add it.

    Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
    Signed-off-by: Robert Marko <robert.marko@sartura.hr>
    Cc: Luka Perkov <luka.perkov@sartura.hr>

--- a/drivers/net/phy/Kconfig
+++ b/drivers/net/phy/Kconfig
@@ -0,0 +0,7 @@
+config MDIO_IPQ40XX
+	tristate "Qualcomm IPQ40xx MDIO interface"
+	depends on HAS_IOMEM && OF_MDIO
+	help
+	  This driver supports the MDIO interface found in Qualcomm
+	  IPQ40xx series Soc-s.
+
--- a/drivers/net/phy/Makefile
+++ b/drivers/net/phy/Makefile
@@ -0,0 +0 @@
+obj-$(CONFIG_MDIO_IPQ40XX)	+= mdio-ipq40xx.o
--- /dev/null
+++ b/drivers/net/phy/mdio-ipq40xx.c
@@ -0,0 +0,160 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/* Copyright (c) 2015, The Linux Foundation. All rights reserved. */
+/* Copyright (c) 2020 Sartura Ltd. */
+
+#include <linux/delay.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/of_address.h>
+#include <linux/of_mdio.h>
+#include <linux/phy.h>
+#include <linux/platform_device.h>
+
+#define MDIO_ADDR_REG				0x44
+#define MDIO_DATA_WRITE_REG			0x48
+#define MDIO_DATA_READ_REG			0x4c
+#define MDIO_CMD_REG				0x50
+#define MDIO_CMD_ACCESS_BUSY		BIT(16)
+#define MDIO_CMD_ACCESS_START		BIT(8)
+#define MDIO_CMD_ACCESS_CODE_READ	0
+#define MDIO_CMD_ACCESS_CODE_WRITE	1
+
+#define IPQ40XX_MDIO_TIMEOUT	10000
+#define IPQ40XX_MDIO_SLEEP		10
+
+struct ipq40xx_mdio_data {
+	void __iomem	*membase;
+};
+
+static int ipq40xx_mdio_wait_busy(struct mii_bus *bus)
+{
+	struct ipq40xx_mdio_data *priv = bus->priv;
+	unsigned int busy;
+
+	return readl_poll_timeout(priv->membase + MDIO_CMD_REG, busy,
+				  (busy & MDIO_CMD_ACCESS_BUSY) == 0, 
+				  IPQ40XX_MDIO_SLEEP, IPQ40XX_MDIO_TIMEOUT);
+}
+
+static int ipq40xx_mdio_read(struct mii_bus *bus, int mii_id, int regnum)
+{
+	struct ipq40xx_mdio_data *priv = bus->priv;
+	unsigned int cmd;
+
+	/* Reject clause 45 */
+	if (regnum & MII_ADDR_C45)
+		return -EOPNOTSUPP;
+
+	if (ipq40xx_mdio_wait_busy(bus))
+		return -ETIMEDOUT;
+
+	/* issue the phy address and reg */
+	writel((mii_id << 8) | regnum, priv->membase + MDIO_ADDR_REG);
+
+	cmd = MDIO_CMD_ACCESS_START | MDIO_CMD_ACCESS_CODE_READ;
+
+	/* issue read command */
+	writel(cmd, priv->membase + MDIO_CMD_REG);
+
+	/* Wait read complete */
+	if (ipq40xx_mdio_wait_busy(bus))
+		return -ETIMEDOUT;
+
+	/* Read and return data */
+	return readl(priv->membase + MDIO_DATA_READ_REG);
+}
+
+static int ipq40xx_mdio_write(struct mii_bus *bus, int mii_id, int regnum,
+							 u16 value)
+{
+	struct ipq40xx_mdio_data *priv = bus->priv;
+	unsigned int cmd;
+
+	/* Reject clause 45 */
+	if (regnum & MII_ADDR_C45)
+		return -EOPNOTSUPP;
+
+	if (ipq40xx_mdio_wait_busy(bus))
+		return -ETIMEDOUT;
+
+	/* issue the phy address and reg */
+	writel((mii_id << 8) | regnum, priv->membase + MDIO_ADDR_REG);
+
+	/* issue write data */
+	writel(value, priv->membase + MDIO_DATA_WRITE_REG);
+
+	cmd = MDIO_CMD_ACCESS_START | MDIO_CMD_ACCESS_CODE_WRITE;
+	/* issue write command */
+	writel(cmd, priv->membase + MDIO_CMD_REG);
+
+	/* Wait write complete */
+	if (ipq40xx_mdio_wait_busy(bus))
+		return -ETIMEDOUT;
+
+	return 0;
+}
+
+static int ipq40xx_mdio_probe(struct platform_device *pdev)
+{
+	struct ipq40xx_mdio_data *priv;
+	struct mii_bus *bus;
+	int ret;
+
+	bus = devm_mdiobus_alloc_size(&pdev->dev, sizeof(*priv));
+	if (!bus)
+		return -ENOMEM;
+
+	priv = bus->priv;
+
+	priv->membase = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->membase))
+		return PTR_ERR(priv->membase);
+
+	bus->name = "ipq40xx_mdio";
+	bus->read = ipq40xx_mdio_read;
+	bus->write = ipq40xx_mdio_write;
+	bus->parent = &pdev->dev;
+	snprintf(bus->id, MII_BUS_ID_SIZE, "%s%d", pdev->name, pdev->id);
+
+	ret = of_mdiobus_register(bus, pdev->dev.of_node);
+	if (ret) {
+		dev_err(&pdev->dev, "Cannot register MDIO bus!\n");
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, bus);
+
+	return 0;
+}
+
+static int ipq40xx_mdio_remove(struct platform_device *pdev)
+{
+	struct mii_bus *bus = platform_get_drvdata(pdev);
+
+	mdiobus_unregister(bus);
+
+	return 0;
+}
+
+static const struct of_device_id ipq40xx_mdio_dt_ids[] = {
+	{ .compatible = "qcom,ipq40xx-mdio" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ipq40xx_mdio_dt_ids);
+
+static struct platform_driver ipq40xx_mdio_driver = {
+	.probe = ipq40xx_mdio_probe,
+	.remove = ipq40xx_mdio_remove,
+	.driver = {
+		.name = "ipq40xx-mdio",
+		.of_match_table = ipq40xx_mdio_dt_ids,
+	},
+};
+
+module_platform_driver(ipq40xx_mdio_driver);
+
+MODULE_DESCRIPTION("IPQ40XX MDIO interface driver");
+MODULE_AUTHOR("Qualcomm Atheros");
+MODULE_LICENSE("Dual BSD/GPL");
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/qcom,ipq40xx-mdio.yaml
@@ -0,0 +0,61 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/qcom,ipq40xx-mdio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm IPQ40xx MDIO Controller Device Tree Bindings
+
+maintainers:
+  - Robert Marko <robert.marko@sartura.hr>
+
+allOf:
+  - $ref: "mdio.yaml#"
+
+properties:
+  compatible:
+    const: qcom,ipq40xx-mdio
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+
+examples:
+  - |
+    mdio@90000 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      compatible = "qcom,ipq40xx-mdio";
+      reg = <0x90000 0x64>;
+
+      ethphy0: ethernet-phy@0 {
+        reg = <0>;
+      };
+
+      ethphy1: ethernet-phy@1 {
+        reg = <1>;
+      };
+
+      ethphy2: ethernet-phy@2 {
+        reg = <2>;
+      };
+
+      ethphy3: ethernet-phy@3 {
+        reg = <3>;
+      };
+
+      ethphy4: ethernet-phy@4 {
+        reg = <4>;
+      };
+    };
--- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
@@ -0,0 +0,28 @@
+		mdio: mdio@90000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "qcom,ipq40xx-mdio";
+			reg = <0x90000 0x64>;
+			status = "disabled";
+
+			ethphy0: ethernet-phy@0 {
+				reg = <0>;
+			};
+
+			ethphy1: ethernet-phy@1 {
+				reg = <1>;
+			};
+
+			ethphy2: ethernet-phy@2 {
+				reg = <2>;
+			};
+
+			ethphy3: ethernet-phy@3 {
+				reg = <3>;
+			};
+
+			ethphy4: ethernet-phy@4 {
+				reg = <4>;
+			};
+		};
+

--fslpnbnjtn5b2pgr--
