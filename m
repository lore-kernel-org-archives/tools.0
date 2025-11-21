Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF8C257831
	for <tools@linux.kernel.org>; Fri, 21 Nov 2025 20:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763757567; cv=none; b=X91mlo3G1NpOpl0d0WqjqdXxjKzat3BunuaxHwYUs+qUdz50wfWsuf6vH/I0eKxPtgxM/UOcIf7MGNLB5/rmpS3BefMdooL8VC9Ml2oNtrxvuK4Fi2t/NZh5q1WjHNOfPQDVRNafwutvw++rKiFH+NrR8AgjkKfDcVlL4gslmDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763757567; c=relaxed/simple;
	bh=+KXmIHMeQWev5ZjJnIMkEITNrbEAgPQISqwmTfNMmy8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=KUNQJ11yqMez9z4sh14rv3FN34lK+5Xk+q6bSQF5lLtLyiyzZs0mD+FKruhBzaf1d8SAVgc7LA3GvJAxJV1CSjFfCc0DS9UeHsLIwTYACtmPramsxO1Ya4Z5G46qpkxasIXgtQeBICzV8A8QT7UWESC7j0iK2Ni/3OIf8hms39c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W1KY/n3d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W1KY/n3d"
Received: by smtp.kernel.org (Postfix)
	id 9D9E0C16AAE; Fri, 21 Nov 2025 20:39:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3D523C4CEF1
	for <tools@kernel.org>; Fri, 21 Nov 2025 20:39:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3D523C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763757565; x=1795293565;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=+KXmIHMeQWev5ZjJnIMkEITNrbEAgPQISqwmTfNMmy8=;
  b=W1KY/n3d2rfo9xbAGbBJeDb9frKVntoxHOSnPvfeMdyTi74/TNz95ylY
   J4mbzNY6+edCbRBb9S1Zn/B6q0kYLoWsk1DUAux6hKZUaNAzcHXL/fAK8
   uW24ol6C50nvOgqfZ4Ze9wTkVcvRtpBgCMhx6q3wUAIv8fOn/FZhPX1ZP
   3dlXWK6R7nPdTf0oGfhVlW5fKZ3bFI8xyURgfeTS50kUsZQfJoum1qkaS
   7N8iELAjkqjFJp774uGBSdNXeERWOAEecQ6LPqW8p9SvWyeY4EfFTUwn/
   kotV0dgrHQf2vWsO18K0Lw5fH8+vH5nLZVwenZqFDOhNloadaL8lgLqmc
   A==;
X-CSE-ConnectionGUID: ncs/hnkoSI6AE5LeM9eOVw==
X-CSE-MsgGUID: ELy1pwv3RdOlbbWpR/HO2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="91340194"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="91340194"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 12:39:21 -0800
X-CSE-ConnectionGUID: IbD/K1I5SnCOwBtc6FoPRA==
X-CSE-MsgGUID: DK52m5+TRYuYPDpYSxLsaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="196925101"
Received: from unknown (HELO hyperion.local) ([10.243.61.29])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 12:39:21 -0800
From: Marc Herbert <marc.herbert@linux.intel.com>
Date: Fri, 21 Nov 2025 20:39:05 +0000
Subject: [PATCH b4] README.rst: switch "Installing" section to "pipx"
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251121-readme-pipx-v1-1-261e669ceccd@linux.intel.com>
X-B4-Tracking: v=1; b=H4sIAOjNIGkC/yWMQQqDMBQFryJvbaA/qKVeRVwY82x/QRsSWwTx7
 k3rcgZmdiRGZUJb7Ij8aNLXkkHKAuNjWO406jPDXmwtYsVEDn6mCRo2I1Uj9ibO81ojFyFy0u1
 /6+Aq9KdLb/fkuP42OI4vI+OvnHMAAAA=
X-Change-ID: 20251121-readme-pipx-1461291bde75
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Marc Herbert <marc.herbert@linux.intel.com>
X-Mailer: b4 0.15-dev

The previous, pip-based instructions on any recent Linux
distribution (less than a few years old) fail instantly with the
well-known "externally managed" error documented at
https://peps.python.org/pep-0668/ and quoted below.

Follow the well tested and proven "pipx" recommendation found in this
error message and switch the README.txt to it. Provide a pointer to how
to install pipx itself. Mention PEP 668 to justify the cost of the extra
step and extra pipx dependency.

$ python3 -m pip install b4
error: externally-managed-environment

× This environment is externally managed
╰─> To install Python packages system-wide, try apt install
    python3-xyz, where xyz is the package you are trying to
    install.

    If you wish to install a non-Debian/Arch/etc.-packaged Python package,
    create a virtual environment using python3 -m venv path/to/venv.
    Then use path/to/venv/bin/python and path/to/venv/bin/pip. Make
    sure you have python3-full installed.

    If you wish to install a non-Debian packaged Python application,
==> it may be easiest to use pipx install xyz, which will manage a    <===== pipx =====
    virtual environment for you. Make sure you have pipx installed.

    See /usr/share/doc/python3.12/README.venv for more information.

Signed-off-by: Marc Herbert <marc.herbert@linux.intel.com>
---
 README.rst | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/README.rst b/README.rst
index 990a3c5cb6f2..5cb9b601d55c 100644
--- a/README.rst
+++ b/README.rst
@@ -12,13 +12,23 @@ See https://b4.docs.kernel.org/ for online documentation.
 
 Installing
 ----------
-To install the latest released version with pip::
+Since 2021-2022, ``pipx`` is recommended to download Python packages and
+their dependencies and install them in isolated environments that
+conflict with neither the operating system, nor with other packages.  If
+you are interested why, see Python document PEP 668. Note: ``pipx``
+existed and worked long before 2021 and PEP 668.
 
-    python3 -m pip install b4
+If you have not already, install ``pipx``. Usually from your Linux
+distribution: https://pipx.pypa.io/latest/installation/
+
+Then, install the latest ``b4`` release from pypi.org::
+
+    pipx install -v b4
+    pipx list
 
 Or to install the latest master (warning, maybe broken!)::
 
-    python3 -m pip install git+https://git.kernel.org/pub/scm/utils/b4/b4.git@master
+    pipx install -v git+https://git.kernel.org/pub/scm/utils/b4/b4.git@master
 
 Shell completion
 ----------------

---
base-commit: 477734000555ffc24bf873952e40367deee26f17
change-id: 20251121-readme-pipx-1461291bde75

Best regards,
--  
Marc Herbert <marc.herbert@linux.intel.com>

