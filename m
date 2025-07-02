Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E2D238177
	for <tools@linux.kernel.org>; Wed,  2 Jul 2025 13:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751461678; cv=none; b=OiMXw9pRcj0mgLn5H5KtKI0CPemCDqFjGB+CEj4r/7SyjXe/EJ0ditI9q/vzubW/SU+KrwBjlNifL2bGaXLGzigI2FlunguYP7D5+wYP/oIr7KhGSQaQyVA4EIJYWKXr3QhMPkFGzr0JisgaccBN2AnXzCBubzlAzOzK0TY8cjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751461678; c=relaxed/simple;
	bh=y83jVdWSFBe9U69PrG2wBa8+gGW5RFArp5QF18O8/i4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AuPrHIsgCDoWw7ORt1P1HEP915JoG+fVUUtszeQ8SwcZJM2zA7CRJwXveXjsgJf/wz1BNi3Jftp4IXkup/9UFmzadxkAJNscJMurmftcK4cfHW+T9mCNMhoCopPisEUtkq3drw32txOPuQ0/zfUsbmDm9ZacduFUq91AN4KZhrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=ySAPnb49; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="ySAPnb49"
Received: by smtp.kernel.org (Postfix)
	id A8EE9C4CEF1; Wed,  2 Jul 2025 13:07:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7E4ABC4CEED
	for <tools@kernel.org>; Wed,  2 Jul 2025 13:07:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7E4ABC4CEED
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562CmuGv002441;
	Wed, 2 Jul 2025 15:07:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=L/rckNM+SL6ZGV8yGt6uwk
	cP1pbNK0PhD70+kQMETRg=; b=ySAPnb494r1vbh2ZD5yP3gzKhS2FiZ8QYL7q83
	+H01FyYeTQo6WQ89VjgcWn3GYJ7C2P5NgtOmkYO7otMq3IZ4psbupL1ESmrTpY6h
	XlmiQ7GqlvVmDjXVvozQlQF1nGedcgZOUQviZ+FD4b9oWRWa7lFSINe/WjDuP2B2
	HdBPWw/Um4XFIfYQshpBcs63+EzrP+v37u7Df1WVtmyAaRvzYTGN2tKk4JnVcl/a
	+kuKn3zPI8aQfJaulRIKwr0bmwpGDMIix0b2d2AluD1yQRnUs2H5R2QrZviFWS3Q
	OjPy01ApR74FC/KaSsVbS6q2N5tf5P7Jo9msc+pnv5owd6Dw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47j5h9297x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 15:07:49 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0568040056;
	Wed,  2 Jul 2025 15:07:02 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ACC4FBBC609;
	Wed,  2 Jul 2025 15:05:40 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Jul
 2025 15:05:40 +0200
From: =?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <clement.legoffic@foss.st.com>
To: <tools@kernel.org>
CC: <clement.legoffic@foss.st.com>, <konstantin@linuxfoundation.org>
Subject: [PATCH] Fix fromaddr test in get_smtp
Date: Wed, 2 Jul 2025 15:05:27 +0200
Message-ID: <20250702130527.1250258-1-clement.legoffic@foss.st.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-07-02_01,2025-03-28_01

If fromaddr returned by sconfig.get('from') is None was converted as a
sring and the test on fromaddr was failing.
Fix this issue by converting fromaddr as a string after the test on it.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
 src/b4/__init__.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index ff6075e3a95e..4309745ebbc3 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -3949,11 +3949,12 @@ def get_sendemail_config() -> Dict[str, Optional[Union[str, List[str]]]]:
 def get_smtp(dryrun: bool = False) -> Tuple[Union[smtplib.SMTP, smtplib.SMTP_SSL, List[str], None], str]:
     sconfig = get_sendemail_config()
     # Limited support for smtp settings to begin with, but should cover the vast majority of cases
-    fromaddr = str(sconfig.get('from'))
+    fromaddr = sconfig.get('from')
     if not fromaddr:
         # We fall back to user.email
         usercfg = get_user_config()
         fromaddr = str(usercfg['email'])
+    fromaddr = str(fromaddr)
 
     server = str(sconfig.get('smtpserver', 'localhost'))
     try:
-- 
2.43.0

