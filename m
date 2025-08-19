Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08DB2877F1
	for <tools@linux.kernel.org>; Tue, 19 Aug 2025 03:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755572576; cv=none; b=WJug5FtZtqGTPLShc5+cxDrKnTbAs5SJhok4bDheyHYt63vY4VPrlb5jkF8Qy3Jq0M1CeRoKE3M00frgCnmjbygf3TZfamrhWwHvgQG1v2RYoc46RDUg67hMXy/EchsT/cQPCnplV+UpQrgHvPKosrcl7YDHMCF7S0gX7Ldez1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755572576; c=relaxed/simple;
	bh=mR4CBjIsr2WD705DrPVRCe33h6uEhPjH1+xkcsxH8eA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=OO8JaJs5Nau6bzx+1kvSuUYb4A7ArCRYHL8CFVfXL6DqgSOseTz0NzEm0GSlfE/hswUmzB7NPIXm7C3N+mEtolTMhAqNoHEV0DeZP08ofTp6MqQd8WX33S+Qv+YKXsNdkvgZWe+nPC1WylEizak2zGpz0aFNTPjksiDPbNOZu98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fkuqorit; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fkuqorit"
Received: by smtp.kernel.org (Postfix)
	id 6C422C4CEED; Tue, 19 Aug 2025 03:02:56 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3AAFAC4CEEB
	for <tools@kernel.org>; Tue, 19 Aug 2025 03:02:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3AAFAC4CEEB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J2mYVx026478
	for <tools@kernel.org>; Tue, 19 Aug 2025 03:02:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=a2mveJLssg4I4FMIK+ULl6
	hsTh5wnuxn+kbJbjwfgkE=; b=FkuqoritLulzIrs6Ku/BHmGR0hOcMUcERVMQEU
	LmB3b/KztlTZ6zs4udsNJMTql2la09sx9yVEFRZxr2i+BDI7HS194LI5vm57upHp
	4GNBx7Ch/ZJ3u3GzFAKvUdoO5dQ4zilHpuQzzpNFBK+oR5YgGwWZaNbrxN+8iiU8
	2MTUqwKgP83TJyVBwRmVa3V/k8MJnp7yFO1Hs8XrPwas9GgWa17znwU4jyIGPD7v
	T1HBplwWxgM399xWDHo+6SXYaC/J9PsjquYD6BNTLdn8xN1UBibuRgg1q9r6bJkd
	mGGoW+saUFKMDHcEw5pQIm331nBA+/ThpsEiEM7NqhAHhGXg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48m71chp65-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <tools@kernel.org>; Tue, 19 Aug 2025 03:02:53 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-32326779c67so4527880a91.1
        for <tools@kernel.org>; Mon, 18 Aug 2025 20:02:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755572572; x=1756177372;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a2mveJLssg4I4FMIK+ULl6hsTh5wnuxn+kbJbjwfgkE=;
        b=C53tar1/sVp6gEKYKOPnEFv+ePz6rEP8z70EHfyuy5FfB9H4AtuxfUBIQFrcc3J7gl
         OLVY/usR8nzy92J18eddfjt9sVZjbvkZ3PPcPhuLdC+CB4B3q3p0aDSEHeOtKa9CKI4m
         M4+8zhKovie0TezNP20k12BE2fAzF81Srsz71l+opoRf+ZD0RYBbYNPhc2jaxznSXLqu
         +pP1NJElbUxuyrOvfBCrApzFSLhbDc6yDlebS0af9ur3TdVSE2x/9yuXp1te8Nbzt1Jm
         BefV9JDM9IKjp5QE9waymwraRTWUnx6Uk55vjbllKGr8TqxwiXvJu1uMGrPzYdfBEsE5
         zd9A==
X-Gm-Message-State: AOJu0YxZ6QTl2yK/36FCEiyoSocYWA7aK197aZL+XdQVzqnx/pTDqlXC
	APWnXOx8pKzeB84k017MN910i59SBpLPdw9M/hQ/k4HRR7P0GRZdzNdbiqBtYtYNFSxrETGOEg7
	R7GD8/BqZpc3iIBQmpeTS9cy38XL/+e3c9rFMb7mTIEg1J5Gz8W0=
X-Gm-Gg: ASbGncusCcf5ufifa0aKWL9Ea9YEIUXTaS37iQ//hi1XQ2MjwKnUl+NCBu3CZhIwCQ4
	eDfHz1IBMwOKgY0Wn+vJuu8wK3XHMiqHtgKeZuBAjheMZtgX6KsZ3cvo9nX2lC1FHeykgbjDdyu
	jxzUrB+o4TORRKzV++gsSPJoxx9y53ZeVHfZ2E8+6lqKFpssGPeiPucZSRrKXm+YSC0J37WOt+U
	anlMqXvT1JQ1+vfT90BlbTaE/pr30+QYN0sgNLyNC9R/DfIGJsx9EAnIAHp0cHPx75wWWAj4Nge
	+uWBqThDk5fy1vD+GeNI+NjnOA+kmUk0kotodzMZmQQpUih2h5EvyWphFDGpfbXfpR9A93bTHjk
	R8l+hdLrqZ0tvhZzQxtfT6CFaar855irRkg==
X-Received: by 2002:a17:90b:3909:b0:31e:5cc7:133 with SMTP id 98e67ed59e1d1-3245e590785mr1429275a91.11.1755572572144;
        Mon, 18 Aug 2025 20:02:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFk1AfZiTbSmKgW8LgcVYOS7KQQUStUi2TVGZWxIKr/bGPU/VkJqfE7bmzYciuwjp4PvkWUEA==
X-Received: by 2002:a17:90b:3909:b0:31e:5cc7:133 with SMTP id 98e67ed59e1d1-3245e590785mr1429229a91.11.1755572571546;
        Mon, 18 Aug 2025 20:02:51 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3237e3ecc64sm1333262a91.15.2025.08.18.20.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 20:02:51 -0700 (PDT)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 11:02:26 +0800
Subject: [PATCH b4 v2] Add Git version check to prevent crash with
 '--default-prefix' parameter
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-ver_check-v2-1-46faa2d6c934@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEPpo2gC/22PwY6DMAxEfwX5vKmICZT01P9YVavYmCXaBdqEo
 laIf9+AtrdeLI01fjNeIErwEuGULRBk9tGPQxL4kQF3bvgW5ZukAXMs81qXapbwxZ3wj6rZNTa
 3UphCIPmvQVr/2FmfQAYuaUcuiqLgBu42Su/iJOHfHOR2T3nT62Kz8tj3fjplYgxRfcSjIBnbU
 FUxshZsGcUSIhVY68rJHtL5OI3huf8w6x32pu6slVa2bdi2mGtyfB5jPNzu7ncLPaQBl3Vd/wA
 gfgpaEgEAAA==
X-Change-ID: 20250815-ver_check-8cad909e343e
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Yijie Yang <yijie.yang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-7229b
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755572569; l=3278;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=mR4CBjIsr2WD705DrPVRCe33h6uEhPjH1+xkcsxH8eA=;
 b=+VSIQ4CkxoZWiSLuMEvqZ+QT9nFA84xTvjHGuLHVXWQsfjHhgCMccIwtBGe79kdSFNtWMgWuX
 0xeY4p+RukqD+o9JFROlERXN362HDudQAvQTUqlfkdzwB1z8Fumxd1Z
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Proofpoint-ORIG-GUID: U7ebu_e5quQhEg8vRDQXk4rE4ZB8WQyH
X-Proofpoint-GUID: U7ebu_e5quQhEg8vRDQXk4rE4ZB8WQyH
X-Authority-Analysis: v=2.4 cv=IvQecK/g c=1 sm=1 tr=0 ts=68a3e95d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8
 a=N2eS-pEXUFdVCCrYCnMA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDE0NyBTYWx0ZWRfX2xCeizdqt4QM
 X0uTQZWzfbp70+D78JzLBtmsifKfp7KfQ++jFRcU2JjCHz7zaCTM4LodadlxNAnu/exC7v4wU3d
 jOD0FE6/02tPvlIhKzD3z3QV/1KDLUcuncCWkQ9HC8wVFv1O36oEO6sL5DEkWc8lNEwUk2zQKXH
 kZsl3EcCOdOxkfm6nxSFwJn5HQWKi4KhBdJRMYmWLjV/slUGwtKXuj5tvw/9PAOJuGb/49wT4hB
 7RZM+HwSM01Cu3SeGZz81oeyBnm5V3xxpMya2G2femgQMY4YE8MxKkQ1Ywhkq3f2sxMv53kRiEu
 oU7lKL/n5Qd+xE/4zKsgxhxyQfZXiSIyMyYIucMDvliG3nbGlFg5p69hswDhZXsBViFlOmJiCTB
 HSNUCKtl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508180147

The '--default-prefix' parameter was introduced in Git 2.40. Environments
running older versions may crash with errors like:

CRITICAL: Failed to convert range to patches: Could not get a patch out
of 5f8e8d5b2c840f8fc5185c2f90d6d275535a6aea

This change adds a version check to ensure compatibility and prevent such
failures.

Fixes: 71916ed ("Create patches with --default-prefix")
Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
Changes in v2:
- Encapsulate the Git version check in a function named git_check_minimal_version.
- Link to v1: https://patch.msgid.link/20250815-ver_check-v1-1-9fdc9f201bac@oss.qualcomm.com
---
 requirements.txt   |  1 +
 src/b4/__init__.py | 25 +++++++++++++++++++------
 2 files changed, 20 insertions(+), 6 deletions(-)

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
index dd5eaf9..2a6b182 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -43,6 +43,7 @@ ConfigDictT = Dict[str, Union[str, List[str], None]]
 from email.message import EmailMessage
 
 from email import charset
+from packaging import version
 
 charset.add_charset('utf-8', None)
 # Policy we use for saving mail locally
@@ -2838,6 +2839,15 @@ def git_run_command(gitdir: Optional[Union[str, Path]], args: List[str], stdin:
     return _handle(out, err)
 
 
+def git_check_minimal_version(min_version: str) -> bool:
+    ecode, out = git_run_command("./", ["version"])
+    current_version = out.split()[2]
+    if version.parse(current_version) >= version.parse(min_version):
+        return True
+    else:
+        return False
+
+
 def git_credential_fill(gitdir: Optional[str], protocol: str, host: str, username: str) -> Optional[str]:
     stdin = f'protocol={protocol}\nhost={host}\nusername={username}\n'.encode()
     ecode, out = git_run_command(gitdir, args=['credential', 'fill'], stdin=stdin)
@@ -3597,13 +3607,16 @@ def git_range_to_patches(gitdir: Optional[str], start: str, end: str,
             logger.debug('Ignoring commit %s', commit)
             continue
         showargs = [
-            '--format=email',
-            '--binary',
-            '--patch-with-stat',
-            '--encoding=utf-8',
-            '--default-prefix',
-            '--find-renames',
+            "--format=email",
+            "--binary",
+            "--patch-with-stat",
+            "--encoding=utf-8",
+            "--find-renames",
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

