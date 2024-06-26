Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4984B19306F
	for <tools@linux.kernel.org>; Wed, 26 Jun 2024 20:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719434276; cv=none; b=Xdx4/c7BI7sEmU34iKqCbMi62vK+J741ueTWvc7foflGBaUFXQGYKNKxV1LaJRJ2odiqSNBPxV1ES5dYnVncy+HXZrIkV10rtyj95Mtw39Y/EdTIbVy5YDDg3GXLgraqJPuwrpmDVrtfOZ2aS/tgZ0wdljqqmk/knw1ZpBj5kKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719434276; c=relaxed/simple;
	bh=GnznZW80ubmadBqXRAEoOAKUS+bVBgnBaU6vCOwH+qA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Pb/4vXxp7ttJ7d4uH6T2UQ2BPwv19hr6N1z03mr+VYEJBuzhbChFmIT1SPa0lDTQ9prpsduVy7AeCGgzzqZNyXo9QSXv5Qni8JrY7G8lGj5geqTxyaz6sYYBwx9j237r6tv8A+o0pGDGQYiOqOQS5ivWR3AjXONy4IM6yiigUvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com header.b=r3TPKDh5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com header.b="r3TPKDh5"
Received: by smtp.kernel.org (Postfix)
	id C0560C32786; Wed, 26 Jun 2024 20:37:55 +0000 (UTC)
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com [67.231.152.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 68DCFC116B1
	for <tools@kernel.org>; Wed, 26 Jun 2024 20:37:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 68DCFC116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=collins.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collins.com
Received: from pps.filterd (m0346902.ppops.net [127.0.0.1])
	by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 45QIv8fl015551;
	Wed, 26 Jun 2024 20:37:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : message-id :
 mime-version : subject : to; s=POD051818;
 bh=Q1EzwbILRtBCLOEXQc8ZSpWCBgv4CCaVGvCRGajLy/8=;
 b=r3TPKDh56gwuIXG+tamU5n5bPBE50p8F9iwotu+SqvOWP1f/mHytiPJb5Fol4ncfH3HW
 +9wfspginthbsRgYg34i83rl6dN32nmv0J9kCeNOELEhGRa3HmT7dsTL4onsfAdeQM7k
 iKxb5SfevvF6jhiSXM5xdtHvl6r4s4RzuTI9O+DIag0FVzXT3tex4+8K+2pJPybsW8XT
 TFhSjIpnk0+3AmHfaFUB9RWKgCb730lK2GYPB4ZVXjLH4Vi/REO/InC2vM9DLPRC6pbz
 qlcEPls2ukuNkVcSycQtuezkNvNfcxAlRwsu4D6GkhhMF28hP9Hk89bY7WssjpmMOksz BA== 
Received: from xusxph004rp050.rtx.com (xusxph004rp050.rtx.com [128.13.120.147])
	by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 400n76v98m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Jun 2024 20:37:53 +0000
Received: from xusxph009rp020.corp.ray.com ([128.13.125.224])
	by xusxph004rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 45QKbpT2013113
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Jun 2024 20:37:52 GMT
Received: from ciulimr01.rockwellcollins.com (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
	by xusxph009rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id 45QKbpcg022474
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 26 Jun 2024 20:37:51 GMT
X-Received: from localhost (unknown [10.148.204.208])
	by ciulimr01.rockwellcollins.com (Postfix) with ESMTP id 7AE36300046E;
	Wed, 26 Jun 2024 15:37:51 -0500 (CDT)
From: Brandon Maier <brandon.maier@collins.com>
Date: Wed, 26 Jun 2024 20:37:50 +0000
Subject: [PATCH b4] Report ecode and stderr from check commands
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240626-report-check-cmd-stderr-v1-1-50d97e394371@collins.com>
X-B4-Tracking: v=1; b=H4sIAB18fGYC/x3MSwqAMAwA0atI1gZqKSJeRVy0adQgfkhFhOLdL
 S7fYiZDYhVO0FcZlG9JcuwFTV0BLX6fGSUWgzXWmda2qHweeiEtTCvSFjFdkVWxc6GhYDvvnYF
 Sn8qTPP95gOBgfN8PXIghMm0AAAA=
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Brandon Maier <brandon.maier@collins.com>
X-Mailer: b4 0.15-dev
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_13,2024-06-25_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_13,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0
 suspectscore=0 spamscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2406260150
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0 spamscore=0
 adultscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2406260151
X-Proofpoint-ORIG-GUID: fgP6aUVbKzb63y0BGx9xPKpBAK_YuZT1
X-Proofpoint-GUID: fgP6aUVbKzb63y0BGx9xPKpBAK_YuZT1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_13,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam policy=outbound_default score=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 mlxscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2406180000 definitions=main-2406260150

The ecode and stderr from check commands gets silently ignored. This
means if the check failed for some unrelated reason, it will appear as a
success to the patch author.

Treat all output from stderr as failure lines, as it's expected normal
findings would go to stdout.

Treat an error from the ecode as meaningful only if stdout and stderr
were blank, as checkpatch normally returns an ecode error if there are
any findings.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 src/b4/__init__.py | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 7164d3f..dff7152 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -1520,18 +1520,29 @@ class LoreMessage:
         topdir = git_get_toplevel()
         mycmd = os.path.basename(cmdargs[0])
         ecode, out, err = _run_command(cmdargs, stdin=bdata, rundir=topdir)
+        report = list()
+
         out = out.strip()
         out_lines = out.decode(errors='replace').split('\n') if out else list()
-        report = list()
-        if out_lines:
-            for line in out_lines:
-                flag = 'fail' if 'ERROR:' in line else 'warning'
-                # Remove '-:' from the start of the line, because it's never useful
-                if line.startswith('-:'):
-                    line = line[2:]
-                report.append((flag, f'{mycmd}: {line}'))
-        else:
-            report.append(('success', f'{mycmd}: passed all checks'))
+        for line in out_lines:
+            flag = 'fail' if 'ERROR:' in line else 'warning'
+            # Remove '-:' from the start of the line, because it's never useful
+            if line.startswith('-:'):
+                line = line[2:]
+            report.append((flag, f'{mycmd}: {line}'))
+
+        err = err.strip()
+        err_lines = err.decode(errors='replace').split('\n') if err else list()
+        for line in err_lines:
+            if line.startswith('-:'):
+                line = line[2:]
+            report.append(('fail', f'{mycmd}: {line}'))
+
+        if (not out_lines) and (not err_lines):
+            if ecode:
+                report.append(('fail', f'{mycmd}: Exited with error code {ecode}'))
+            else:
+                report.append(('success', f'{mycmd}: passed all checks'))
 
         save_cache(report, cacheid, suffix='checks', is_json=True)
         return report

---
base-commit: 131835a44c63511e2def9d7adc680754b7ea502c
change-id: 20240626-report-check-cmd-stderr-84b1cb28aa40

Best regards,
-- 
Brandon Maier <brandon.maier@collins.com>

