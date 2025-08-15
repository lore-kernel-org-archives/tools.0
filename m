Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5703425A348
	for <tools@linux.kernel.org>; Fri, 15 Aug 2025 09:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755248744; cv=none; b=GCLHRrDcDqgKLBdNhAfV9990HFKt9OIoovHRxwzZLMv0OR1rnQ4cVB0qkoXwiT/f+LU1fWzVY+zTx7/Hjpb45e8tlBMhoMBh7C6Sw5lm+ljZFoKYf3SopZyCvN9dnYE7X1Pj8UFhgWcBVlXOgVbkzP/nmUsmjlHoG9k0XXWEV18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755248744; c=relaxed/simple;
	bh=YrGmLWMadix/iVZhM0c0kmRmzu25FSuev+djJkPij2I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=U37kcHWPAYTBQS7Q4J9qUvuD2y25gMiKuhZ0PSL+oKVwsYPQQ07IRNJtnXqOs3vDcZWjBlD1fxfxVYmHnchrD3D1g66eaPCr6KhkQt9zLfKchLeF5JoYaBbmnkugvRLtL92g2wVqTTx68rkYpgg1MI/OVe4954VLqKc5qISM/oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VS00xT2p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VS00xT2p"
Received: by smtp.kernel.org (Postfix)
	id E9B14C4CEF5; Fri, 15 Aug 2025 09:05:42 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 14334C4CEEB
	for <tools@kernel.org>; Fri, 15 Aug 2025 09:05:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 14334C4CEEB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57F8oa0M023971
	for <tools@kernel.org>; Fri, 15 Aug 2025 09:05:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VetPTw9sZXu106ql3HKxq/
	psUUudy6MVMAYLm6xcf3s=; b=VS00xT2ptAyej8TXSZuewMoaM12uOqY3C1RjNc
	EZoDcBjt4sTz23TcdIwK6TF3g505JKJdgtbUUJf8OI+hn2Dy3eUjJ+DuwnZ3IsJd
	rso3moxQdAoTeqk8hAPLP4ZuD0e6sj38G/fYfnyeb7+6yvF0WJ07K2gV10Gc509B
	ATC9WoEjOpY+Z8niFTp7WABx/P2eSIYYlMncjkf473ZtkPPndOXEDgWFQjgCHKJC
	2FGWPAlXeEPvjfqo744NQyFCbTkq+ILCf3sYg6TKZCq6WmmAmpUCLDhMZXLYRcSv
	+lZFAoKjq7uYydLO6isqPaWDjAeuihawI7CezIzDzroDGRXA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48gr9ry8my-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <tools@kernel.org>; Fri, 15 Aug 2025 09:05:40 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-76e2ebafe0aso1590451b3a.3
        for <tools@kernel.org>; Fri, 15 Aug 2025 02:05:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755248740; x=1755853540;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VetPTw9sZXu106ql3HKxq/psUUudy6MVMAYLm6xcf3s=;
        b=gUjjL5ccGS9nOpk1z8MDUDaCfDn06yBlxWkfpbc9Aw2TTOlKlvpl/L2YADXpxJ5Gm6
         73Yzmfpt2HfXN9wh6uq0uGQJQxxmjgpkNeblQVM0H83yD4MDg7Pmk+lzlEY7jRCDsV/z
         RrrRyVLKyJVXL8WY+Cgw6Cf//eNEki05Gw2OtHYY+9eoVtc+/pSYn2+I3HkivfsEF9pE
         XxUSiBon1UK14cHzHtYhcEHiRGiGnJdaGK1zK6XWE9oaC4mfGmBk6wtjsHh2UtYSTwID
         RIePmqQRgmqgbtoofo9FGnW8Z1H5yL+PzidMpxp7zirlKQEGioyQqkBxE94J2+iU/2FH
         dcKA==
X-Gm-Message-State: AOJu0YzgA3PJL5BWxzWTRzpgi5NSwiAs7mSoSmbkWzMfkMjBf5zUx3KH
	qbR5m9lmzbTIaANrnRctsUVGs0MtdSmgjEDv8hpP92zKK03aCgk1d+JpUEh7pNDG92xlunktb5M
	3tcgceDAdLmHu7bog1s5djil4bO5fzbUIViXPA8Nf2b5PT3T+sYA=
X-Gm-Gg: ASbGncstcxmqXkxgWhX8jzsUJF2lK2c2G+EB6YF5fjgLud3vr9PXnhbiyrZ9QRN4yjw
	X34QQqM/5z9XjP4HD4lyIwbPCyJPXV63u9SpPJKRDKhmi+Ua8Bp0Vwj7HAYTdIByp4VvmYHeEvz
	LXVYg8OHdQfdUREujGe5Bu7Nsp9PEMAz1Z9Bk7HFdOHRMAlVmuk60es80MivFQN7JXeWkOYIWgO
	ynqC5EtbX/yJfyCsRCXBEhBuwPJsiEWj41YmXqw/fZZIjhPqecQscy57fxzVGhj0GvByd9sy2sB
	NMJB34Br0/GArTsfDHt84ZZw2uqSSsUVwnfqBHzd0sXhMLudQoEWNPgVGLKuz8ParKzydE0mKEE
	hu5CwbiapLbKddudzmv/bSsI6qty9IifpdA==
X-Received: by 2002:a05:6a00:b8e:b0:76b:fe65:71f5 with SMTP id d2e1a72fcca58-76e4480306fmr1829462b3a.20.1755248740079;
        Fri, 15 Aug 2025 02:05:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwWIQHNBV0PnNMo2mOwmaYbP7hhTsDuvsF1ISKYVo6UGzPa3WG3AHfL4oaIdIyTz0tzvlspQ==
X-Received: by 2002:a05:6a00:b8e:b0:76b:fe65:71f5 with SMTP id d2e1a72fcca58-76e4480306fmr1829418b3a.20.1755248739637;
        Fri, 15 Aug 2025 02:05:39 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e4528c81fsm711491b3a.42.2025.08.15.02.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 02:05:39 -0700 (PDT)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Date: Fri, 15 Aug 2025 17:05:12 +0800
Subject: [PATCH b4] Add Git version check to prevent crash with
 '--default-prefix' parameter
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-ver_check-v1-1-9fdc9f201bac@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEj4nmgC/zWN0QqCQBREf0Xuc4JeV9N+JST2XsdcQqtdk0D89
 9aoxxnOnFkpwDsEOiUreSwuuPsUQ35ISAc7XZG6LmbijMuszst0gb/oAL2ltdquyRoUpgBF/uH
 Ru/fXdSYx1MZObEAq3k467JbRhhn+B3s8X/Fv/i92VO/j6OZTAmNE6iMfwWKaTqpKWXNwr4xGm
 KXgOq8sqN22Dy/+P2zEAAAA
X-Change-ID: 20250815-ver_check-8cad909e343e
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Yijie Yang <yijie.yang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3332e
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755248738; l=2182;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=YrGmLWMadix/iVZhM0c0kmRmzu25FSuev+djJkPij2I=;
 b=NC3BDxQq+o1+yN0h0OF9HcvEUzGDt6YRFnGRX2ZPJ7tuz278jrjQILg3WSTnBasf/P+bHPDzI
 9RA6zmPaxXEDnjRIlGs2ZDApr+z/6FcumQnvAieta+jv66LnpiNUa8T
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEzMDA5NCBTYWx0ZWRfX6sCwezQ5TEDw
 u0BABEP0f1yS+/roAs/YcWR1hPrY1LC/TcvbmO97l4q7dkpMXHHfk4xsG9hqo8TXdDJhsm7AEKs
 5Nlr61M3IZd2uSchFmdgc8r+QIQjavT+6wz/MNEk+vlS7ssHxFn/S1JUpFuNCFw5XuPYT01NXQU
 pelnq2ZKv4DShQypJPaxCnkYsgXw+5u0VuuH5BOBiY24wQndl3IRLkya9GRmn/H87gYs4WDj+Nh
 E8Bnr4cfIv+iH5HlDFqGz4P/q5I5p1voqy2uE1VUG1e/6IVM2Ql3OWw1+ha9Hpk8ccE6q77uQ5g
 C9DTAPdn6E3MJfGC+hVuMku7MSA7issjS5Fj+Z2dGeClZZKzPXk9lwI8dyfuPf8k2kCdYC+ILHY
 D+ENp/GK
X-Authority-Analysis: v=2.4 cv=NIrV+16g c=1 sm=1 tr=0 ts=689ef865 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=K6Asoac5vCecXSqNZEoA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: H_qiysJ_pcfYFoAUPDpQaZK8yWCzesd1
X-Proofpoint-GUID: H_qiysJ_pcfYFoAUPDpQaZK8yWCzesd1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_03,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1011 impostorscore=0 adultscore=0 suspectscore=0
 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508130094

The '--default-prefix' parameter was introduced in Git 2.40. Environments
running older versions may crash with errors like:

CRITICAL: Failed to convert range to patches: Could not get a patch out
of 5f8e8d5b2c840f8fc5185c2f90d6d275535a6aea

This change adds a version check to ensure compatibility and prevent such
failures.

Fixes: 71916ed ("Create patches with --default-prefix")
Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
 requirements.txt   | 1 +
 src/b4/__init__.py | 7 ++++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

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
index dd5eaf9..5f4bf4a 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -43,6 +43,7 @@ ConfigDictT = Dict[str, Union[str, List[str], None]]
 from email.message import EmailMessage
 
 from email import charset
+from packaging import version
 
 charset.add_charset('utf-8', None)
 # Policy we use for saving mail locally
@@ -3601,9 +3602,13 @@ def git_range_to_patches(gitdir: Optional[str], start: str, end: str,
             '--binary',
             '--patch-with-stat',
             '--encoding=utf-8',
-            '--default-prefix',
             '--find-renames',
         ]
+        ecode, out = git_run_command(gitdir, ["version"])
+        current_version = out.split()[2]
+        if version.parse(current_version) >= version.parse("2.40"):
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

