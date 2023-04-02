Received: from nautica.notk.org (nautica.notk.org [91.121.71.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6055617E2
	for <tools@linux.kernel.org>; Sun,  2 Apr 2023 03:24:56 +0000 (UTC)
Received: by nautica.notk.org (Postfix, from userid 108)
	id D83D3C009; Sun,  2 Apr 2023 05:24:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org; s=2;
	t=1680405894; bh=i/t0xNHcnQ+/D36cgFqJqCAr0jIiG8gSEmiugDSdawA=;
	h=From:Date:Subject:To:Cc:From;
	b=ArINxAXxGdzWGm13A/f5GWSVCT2FEhaWzq6sWDGWGerSzgTo+/DnAj+4c3Uz/OmVx
	 j3oxsdhZG9L5zoVTlj9m8x67fu/pYPhJxbdReE84PbeX4BZpWZdCLwC0g849dob9Qf
	 icIDLIekJI9OrJYheCJFsWpEorp9qIMMcfLbabwqEEUXf8yDDbFWJG0YFeeJzGi+qW
	 WamZlZvbjdLOdtDYsp6UbNXXHDPUCHckUvEZHZCBMW6wk1JoCNUr45qTy6SvCSJAsw
	 MGwQ4vHSj95BCNmhHn6GkcGINweCqo67xW41ISyf7p82KFTM6bIkFy/6Amd2q9ywmC
	 STffqpjoJ4rXg==
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on nautica.notk.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED
	autolearn=unavailable version=3.3.2
Received: from odin.codewreck.org (localhost [127.0.0.1])
	by nautica.notk.org (Postfix) with ESMTPS id 4A9A0C009;
	Sun,  2 Apr 2023 05:24:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org; s=2;
	t=1680405894; bh=i/t0xNHcnQ+/D36cgFqJqCAr0jIiG8gSEmiugDSdawA=;
	h=From:Date:Subject:To:Cc:From;
	b=ArINxAXxGdzWGm13A/f5GWSVCT2FEhaWzq6sWDGWGerSzgTo+/DnAj+4c3Uz/OmVx
	 j3oxsdhZG9L5zoVTlj9m8x67fu/pYPhJxbdReE84PbeX4BZpWZdCLwC0g849dob9Qf
	 icIDLIekJI9OrJYheCJFsWpEorp9qIMMcfLbabwqEEUXf8yDDbFWJG0YFeeJzGi+qW
	 WamZlZvbjdLOdtDYsp6UbNXXHDPUCHckUvEZHZCBMW6wk1JoCNUr45qTy6SvCSJAsw
	 MGwQ4vHSj95BCNmhHn6GkcGINweCqo67xW41ISyf7p82KFTM6bIkFy/6Amd2q9ywmC
	 STffqpjoJ4rXg==
Received: from [127.0.0.1] (localhost [::1])
	by odin.codewreck.org (OpenSMTPD) with ESMTP id 031cc457;
	Sun, 2 Apr 2023 03:24:50 +0000 (UTC)
From: Dominique Martinet <asmadeus@codewreck.org>
Date: Sun, 02 Apr 2023 12:24:49 +0900
Subject: [PATCH b4] b4.sh: keep existing PYTHONPATH if set
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230402-wrapper-keep-pythonpath-v1-1-e2bc5e556a67@codewreck.org>
X-B4-Tracking: v=1; b=H4sIAID1KGQC/x2N0QrCMAwAf2Xk2UBXp4i/Ij6kWbRF7EJapjL27
 +t8PI7jFihiSQpcuwVM5lTSlBv0hw44Un4KprExeOePbnAeP0aqYvgSUdRfjVNWqhE5EJ/YMZ/
 7C7Q6UBEMRpnj3r+pVLFdqMkjff/LG4QB7uu6ARU3TIqGAAAA
To: "Kernel.org Tools" <tools@linux.kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Dominique Martinet <asmadeus@codewreck.org>
X-Mailer: b4 0.13-dev-208b4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1099;
 i=asmadeus@codewreck.org; h=from:subject:message-id;
 bh=jzCg5PVGLZwgO3U2+QMtzFJcaB+DeFU+GIfg5R7AI8A=;
 b=owEBbQKS/ZANAwAIAatOm+xqmOZwAcsmYgBkKPWCVCH2gIHVxjcaVmKrZIoCrYRFsZo87CyPQ
 HcPZgNMdcSJAjMEAAEIAB0WIQT8g9txgG5a3TOhiE6rTpvsapjmcAUCZCj1ggAKCRCrTpvsapjm
 cMXVD/4iUkHKdE/L89xIcmo9F1VFs0ROWn6oG3Q0OSr+B+CFxgwA8x3h1MUYZ8YhzaK9+rcYTf6
 g1AkCqzsSHtUKIp7H5wSOh9g4wzpeazezI7waKY0/mIFXLcIRMO0UA9y5kW6ijAfFYKWaZp1bXa
 gqmeg7qzqKmnS1epOJqQgOdasnSR190kwsgSfkveTrSfg20AxoXPwVRo+FGr/qcKX+WA2til7l0
 pKhQOlWQ1XkMmQ529SaQgn+7DG80A57TApUF912yyqIm3fNGgPLEG6yc7Wcmm252O71kSuJnort
 NFIlgC8FEZDLKCzvU4L4Lz7i/FcH2mf30J35aiX8b7JZpD4i009scGnnBLfT6H7lZE4hgavaZ/k
 b/Xc3ah/eOnJIiPk6kvYbcbtKg256xYdngSWcbEmyZbkOJZxeMwuvVOrGHkcFtu/oRqTcH6n9Dc
 2zoUYJAeB46wozzgMN4hRjaRrISkwqxIXwTOeF3DEC1zpSAMNkUjLC2KG/hz8gHAoicRUNlA+ei
 f8OP1IlQLXC3jTeBqxLOzc0SXvVw87YaUkeLXFJQKtq7MbE1ZWEVtrPdDGmRC8Dgvjn3vaR2xTd
 c6eLDSRUl/cbSpiBXWPUjsLV5pQvIUeYHjYIFCsg8O6vpCWIbaa3E6gojHb8cnEtl2NH2nbGSEf
 YHnJjFnmCSDcpQg==
X-Developer-Key: i=asmadeus@codewreck.org; a=openpgp;
 fpr=B894379F662089525B3FB1B9333F1F391BBBB00A

for setups depending on PYTHONPATH being set to provide dependencies
e.g. requests, b4.sh overriding of the variable is too strong.

Set current directory and patatt's first but keep PYTHONPATH if it was
not empty.

While we are here, remove useless use of env: the shell does the job
just fine if the variable is set before exec

Signed-off-by: Dominique Martinet <asmadeus@codewreck.org>
---
 b4.sh | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/b4.sh b/b4.sh
index 10d33b740d5e..bd7e587151f2 100755
--- a/b4.sh
+++ b/b4.sh
@@ -6,4 +6,5 @@
 REAL_SCRIPT=$(realpath -e ${BASH_SOURCE[0]})
 SCRIPT_TOP="${SCRIPT_TOP:-$(dirname ${REAL_SCRIPT})}"
 
-exec env PYTHONPATH="${SCRIPT_TOP}:${SCRIPT_TOP}/patatt" python3 "${SCRIPT_TOP}/b4/command.py" "${@}"
+PYTHONPATH="${SCRIPT_TOP}:${SCRIPT_TOP}/patatt${PYTHONPATH:+:$PYTHONPATH}" \
+	exec python3 "${SCRIPT_TOP}/b4/command.py" "${@}"

---
base-commit: 00303592f25693cb4eddf58fb51063afcff8dceb
change-id: 20230402-wrapper-keep-pythonpath-cbac5c0cc618

Best regards,
-- 
Dominique Martinet | Asmadeus

