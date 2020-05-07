Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.5097.1588855860808001830
 for <tools@linux.kernel.org>;
 Thu, 07 May 2020 05:51:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: lorenzo.pieralisi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F21B1FB
	for <tools@linux.kernel.org>; Thu,  7 May 2020 05:50:59 -0700 (PDT)
Received: from e121166-lin.cambridge.arm.com (e121166-lin.cambridge.arm.com [10.1.196.255])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3B0073F68F
	for <tools@linux.kernel.org>; Thu,  7 May 2020 05:50:59 -0700 (PDT)
Date: Thu, 7 May 2020 13:50:54 +0100
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: tools@linux.kernel.org
Subject: [b4] some issues with b4 ty $fromname
Message-ID: <20200507125054.GA19511@e121166-lin.cambridge.arm.com>
MIME-Version: 1.0
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Groupsio-MsgNum: 142
Content-Type: multipart/mixed; boundary="OgqxwSJOaUobr8KG"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

--OgqxwSJOaUobr8KG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I have just run into a name formatting issue with b4 ty command, email
message generated (as an example) attached ($fromname garbled), I am
sure it is a pretty trivial set-up issue with email encoding and my
python environment, please let me know if that's something easy to fix
and thank you very much for this very useful tool.

Thank you,
Lorenzo

--OgqxwSJOaUobr8KG
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: attachment; filename="pali_kernel_org_patch_pci_tegra_fix_reporting_gpio_error_value.thanks"
Content-Transfer-Encoding: quoted-printable

From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: Thierry Reding <thierry.reding@gmail.com>, Andrew Murray <amurray@theg=
oodpenguin.co.uk>, Pali Roh=E1r <pali@kernel.org>
Cc: linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, lin=
ux-pci@vger.kernel.org, linux-tegra@vger.kernel.org, Jonathan Hunter <jonat=
hanh@nvidia.com>
In-Reply-To: <20200414102512.27506-1-pali@kernel.org>
References: <20200414102512.27506-1-pali@kernel.org>
Subject: Re: [PATCH] PCI: tegra: Fix reporting GPIO error value
Message-Id: <158885274757.4330.6450290398257549869.b4-ty@arm.com>

On Tue, 14 Apr 2020 12:25:12 +0200, =3D?UTF-8?q?Pali=3D20Roh=3DC3=3DA1r?=
=3D wrote:
> Error code is stored in rp->reset_gpio and not in err variable.

Applied to pci/tegra, thanks!

[1/1] PCI: tegra: Fix reporting GPIO error value
      https://git.kernel.org/lpieralisi/pci/c/3f5491b907

Thanks,
Lorenzo

--OgqxwSJOaUobr8KG--
