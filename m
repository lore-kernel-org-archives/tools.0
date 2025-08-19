Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2B023D7D3
	for <tools@linux.kernel.org>; Tue, 19 Aug 2025 06:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755584588; cv=none; b=u6xG24jznIgcb1BsR21dB14+Vy3Hp38gkLMXVuw/rr5B533Hntf50FDLoFf/00GMrZvkDBWGp1XYjriKHMVtA6L1+Ko0NLzH9RepPaKXa48kDOv3ISzl9Ty7fKeTQRCcqz6T6EL8TOvEfAhFBE4XwNjtNglzsArFgCHnJcgTobg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755584588; c=relaxed/simple;
	bh=n0tAbxj9DDUB4k1QZr8fUz+BAoSmu41JF9dHNZTDuIk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SANY+yJMFfAG0z8eb55fyJ4yTgxzEg9Kvd17+da0oavgNOvAl0sqlA2FhoxRF43CWIR1Pf8+6RYCMc5VyEjOYGamsIjEVW+F2FBR+xre+nrvkH6/7zVFpz0BRfQ5r+99UUDzaqDbX47z2QrOBaVyupBQpic4SPJHWkBgo+RwIgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HgIRB5UP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HgIRB5UP"
Received: by smtp.kernel.org (Postfix)
	id EE784C4CEF4; Tue, 19 Aug 2025 06:23:07 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BBB1AC113CF
	for <tools@kernel.org>; Tue, 19 Aug 2025 06:22:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BBB1AC113CF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J1GLuM011948
	for <tools@kernel.org>; Tue, 19 Aug 2025 06:22:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DekbxML8ILdnVGcElyllMg
	cFCiCObg7cMrh7mrdaiWU=; b=HgIRB5UP6NAnXaAYqPUssdxyLoQx7RhtlzbTD/
	I7LA9cj4WUwf/vkZfFtaWq4JCmuY8QkDV6TMu5Fx3ZXrM8bugvqFWF6XSNjbZCn2
	SMqEUoGTerNnM39BbSAo0ItcSvDv6eOYW3EneoG/QZ7JghxkauUuwaZOv0uzhHdz
	vKi2DnU/cb6Ada363WbPaa+VBk5nHOhn2G+jxCRjHtu5TInhpL1gEMR69YekpaH0
	yeGgIOSu8i39gXPyFgfoM98q3Prm9ssXslvm46jiDkS9e6svrzTp56vr5Mrevc8l
	+8cRQRAc4KTZxztwL6nd8ZdtXPr/AESoFsj95qXfw0dMxjVg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jk99qc8x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <tools@kernel.org>; Tue, 19 Aug 2025 06:22:48 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b47173afd90so9090799a12.1
        for <tools@kernel.org>; Mon, 18 Aug 2025 23:22:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755584567; x=1756189367;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DekbxML8ILdnVGcElyllMgcFCiCObg7cMrh7mrdaiWU=;
        b=rZm1/qdKAUbQvx/zQFD8E5nf8m/QgLyVwa5WAKZLb8Lc1VEkopUZzyc92+jh478yfa
         3N3nUDBMJUq0/iM7r4DV4egIJT3WHRBBMxl3OHJ/+kG1NAR/qS4GoncVMGIWyXvoMBR0
         C42IobRHHTSk4eWsgYPVx935XevVtIXMovgZLmEaDtAod1/QD4+HWKg5NycI1G/nKd9j
         vBpwtdcMs82nDGi0Spx8K374OPzTb1q4PUFKPKhTTXVXioBlQt8LDRbscIhFdrd5ArSD
         TsUrtG08NIEYRo0hqTO1YDAGXPquln01NX8iIQS5A/tpIjLlJHHwYOyLm1li+3JersPp
         F40A==
X-Gm-Message-State: AOJu0YyQk2Ri/xG/wzpnQofPu3L+FSwRmz7EOg7SFwhkHbr0e6BTXhGT
	SdvpPDWJ4QpRmMZeLLFPYSfQpNpJMYPxFO/xVpvNIblqCMKFzqMmto0lErMEh5KS5irmzfl7hI/
	Q24e3IPUfYPHuaw8Tqp/9WHII6OrG8RZWtGadSltQt65wqMrFsHQ=
X-Gm-Gg: ASbGncuYfweF14MFEj7w5XbGxyqLLIi8EQ3x3c6nuXpSPtIBos4W/dAP3hJHDxPcKvz
	YiSXS3SVzq9MpbJfEEOOqUHWEOguWQQLcapWO65V/zMGzbLBQNFiEvC41A2A+D3uo1gPs/dzbyN
	7oZ+qxUUxhuZctnStX+5sJ43116dJ1CQpauCqKI6q2EO2kny0gy6COD3TUo5I7wB42bu9sMkY9C
	zUOTcyPWBTGsSO6OVDiLeCwgXGIZq0Q135iP8eO60FIEcSbEnmfsG2zXM4PgoAgZlar1E9S2iFN
	nUqdoZSjXC0Gc5dJX+bCpMzv7GvqA4Ot7ynBdoeCObtD5bcMlFVBnI8IzrL4DEDpxh5926+PWlW
	9eVlqm90OVbUCq8Ye2mw2qvgK/1NVkiSZng==
X-Received: by 2002:a05:6a20:12c1:b0:240:160b:81bf with SMTP id adf61e73a8af0-2430d395662mr2015451637.19.1755584567542;
        Mon, 18 Aug 2025 23:22:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IET0GBP/VOWByopf4t1kmMel1GAatA2ScprDO/xr9eiuL0yui1nFiMt/NIKZ3jNZtQT2qxe8w==
X-Received: by 2002:a05:6a20:12c1:b0:240:160b:81bf with SMTP id adf61e73a8af0-2430d395662mr2015429637.19.1755584567112;
        Mon, 18 Aug 2025 23:22:47 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d544de1sm1394174b3a.94.2025.08.18.23.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 23:22:46 -0700 (PDT)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 14:22:24 +0800
Subject: [PATCH b4 v3] Add Git version check to prevent crash with
 '--default-prefix' parameter
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-ver_check-v3-1-9877d033bb7d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACAYpGgC/23PQW7DIBAF0KtYrEtkBkJMVr1HVVUwDDVqbTfgo
 FaR716MWimLbJAGfd4fbixTipTZubuxRCXmuMx1kE8dw9HO78SjrzODHo79II68UHrDkfCDD2i
 96Q1JJYnV/FeiEL+b9cKcYq/1ztlM3CU747grk80rpb9wosu19q3/L/YoLtMU13NHSjk3nOBE4
 JTxTmsEFAQBgYwDcBIGoS21kjHmdUk/7Q9FNOzBukVwwU3waAL0wll8XnI+XK72cy891KNhBe4
 Bcw9ABZQO1oLXaKR6AGzb9gsRAnMWUwEAAA==
X-Change-ID: 20250815-ver_check-8cad909e343e
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Yijie Yang <yijie.yang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-5bbf5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755584565; l=3226;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=n0tAbxj9DDUB4k1QZr8fUz+BAoSmu41JF9dHNZTDuIk=;
 b=Yg/be/ZZM+u1bmMJmUAaRxboMMTZdD+AshNTwmhXeG+racwsqNXG8+hayELgKFLGbeFKKcIqH
 hinN8W9N2CNDx1kujMAdNe7B6cWrXWCfW75Q+u/9x+5f4nnL/vgKtju
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Proofpoint-ORIG-GUID: GKXoWpDkIik60I42GPjmuJ6TeGT0BHyw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDA0NSBTYWx0ZWRfX6fjLgIQ/tMGj
 0DPxj7kOqqnpAHw36velksyJCxTer9fft9FirDCAVlEKZOQxp5AFa7OeCNcbXl9STjjui89kXet
 M7tKNzIxbo0HmO/qrHDNrGL+oEvaCnzYVCgjkta55qX8YCkO95lG8owI2n/G/1xGBR8mkGGCceA
 PwgSFlp1VZgrPCZnAw4vmbRmuACys2MQCk+Oo26lESr5A/Oxooh600+d4Y34FOVse7eqU8zn4JU
 w+o7Fg+T2kTIAOJjBngfj2padecn3Yr9rqGHzzDJ4vZVYzlNbOPP8UdY0Zi65NNvXM0h28LfF8A
 zrtPNJX4uxy/q8OVh260U0UYMQKjBlZgY2j268HhECUGt/MdMp/V8Ww0j9Vabz3bbyv0ZXWohwT
 VskjgXY9
X-Authority-Analysis: v=2.4 cv=IIMCChvG c=1 sm=1 tr=0 ts=68a41838 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8
 a=N2eS-pEXUFdVCCrYCnMA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: GKXoWpDkIik60I42GPjmuJ6TeGT0BHyw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160045

The '--default-prefix' parameter was introduced in Git 2.40. Environments
running older versions may crash with errors like:

CRITICAL: Failed to convert range to patches: Could not get a patch out
of 5f8e8d5b2c840f8fc5185c2f90d6d275535a6aea

This change adds a version check to ensure compatibility and prevent such
failures.

Fixes: 71916ed ("Create patches with --default-prefix")
Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
Changes in v3:
- Optimize return style of git_check_minimal_version.
- Set gitdir to None to indicate that the operation is independent of any specific directory.
- Remove unintended changes to quotation marks.
- Link to v2: https://patch.msgid.link/20250819-ver_check-v2-1-46faa2d6c934@oss.qualcomm.com

Changes in v2:
- Encapsulate the Git version check in a function named git_check_minimal_version.
- Link to v1: https://patch.msgid.link/20250815-ver_check-v1-1-9fdc9f201bac@oss.qualcomm.com
---
 requirements.txt   |  1 +
 src/b4/__init__.py | 12 +++++++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/requirements.txt b/requirements.txt
index 3781f49..ed9b832 100644
--- a/requirements.txt
+++ b/requirements.txt
@@ -210,3 +210,4 @@ urllib3==2.4.0 \
     --hash=sha256:414bc6535b787febd7567804cc015fee39daab8ad86268f1310a9250697de466 \
     --hash=sha256:4e16665048960a0900c702d4a66415956a584919c03361cac9f1df5c5dd7e813
     # via requests
+packaging
\ No newline at end of file
diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index dd5eaf9..f425fd6 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -43,6 +43,7 @@ ConfigDictT = Dict[str, Union[str, List[str], None]]
 from email.message import EmailMessage
 
 from email import charset
+from packaging import version
 
 charset.add_charset('utf-8', None)
 # Policy we use for saving mail locally
@@ -2838,6 +2839,12 @@ def git_run_command(gitdir: Optional[Union[str, Path]], args: List[str], stdin:
     return _handle(out, err)
 
 
+def git_check_minimal_version(min_version: str) -> bool:
+    ecode, out = git_run_command(None, ["version"])
+    current_version = out.split()[2]
+    return version.parse(current_version) >= version.parse(min_version)
+
+
 def git_credential_fill(gitdir: Optional[str], protocol: str, host: str, username: str) -> Optional[str]:
     stdin = f'protocol={protocol}\nhost={host}\nusername={username}\n'.encode()
     ecode, out = git_run_command(gitdir, args=['credential', 'fill'], stdin=stdin)
@@ -3601,9 +3608,12 @@ def git_range_to_patches(gitdir: Optional[str], start: str, end: str,
             '--binary',
             '--patch-with-stat',
             '--encoding=utf-8',
-            '--default-prefix',
             '--find-renames',
         ]
+
+        if git_check_minimal_version("2.40"):
+            showargs.append("--default-prefix")
+
         smcfg = get_sendemail_config()
         if not get_git_bool(str(smcfg.get('mailmap', 'false'))):
             showargs.append('--no-mailmap')

---
base-commit: e44bb8727e2b49db66c2c1e2fc2e9b22b32816ae
change-id: 20250815-ver_check-8cad909e343e

Best regards,
--  
Yijie Yang <yijie.yang@oss.qualcomm.com>

