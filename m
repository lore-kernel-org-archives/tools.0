Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56597FBB6
	for <tools@linux.kernel.org>; Mon,  8 Jul 2024 11:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720439737; cv=none; b=S3Po/f3skQOkOG417HS0YQW5cdPvArOWvBxjLJGYYI2Rn2KLTPqW56lZXXajoAd9Rg9oRSF787UTXIWbnSEzJPulqNdfCoXIVc8oFo+PiVi61tzcCp4kTeL6XadaIqFEK7YojV7vrEA6bqiErks3AOzY2DJ1i4kUlUDh72RyeEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720439737; c=relaxed/simple;
	bh=Mpo5Ve2OlJ8Oxx08lQU6QRhk9c9XJJDpJ9C7vyKnIH8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=b+ySyRVGptQJVNbwPz69tmvMJ06qdn/8SAyPOlQICNgqYypaO/kYvzxHi7zlw2QU4NaiHiZ+q0g87mOTDsOdFcm8FMfmSHG871Nx+KGEUbtkw++WKE8E2/SZWRNqPdrKLY9Baeoo0sEq9bQ3RjctUt/F7KDOlVZLe3kaN0c8Mmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=fV+TBMs1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="fV+TBMs1"
Received: by smtp.kernel.org (Postfix)
	id 6E043C116B1; Mon,  8 Jul 2024 11:55:37 +0000 (UTC)
Received: from pv50p00im-tydg10021701.me.com (pv50p00im-tydg10021701.me.com [17.58.6.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AF94AC3277B
	for <tools@kernel.org>; Mon,  8 Jul 2024 11:55:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AF94AC3277B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=icloud.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; t=1720439736;
	bh=2MY+gJzJLcNRBG89uGot63LWxv1pYC3kTexrK5Hm9/w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To;
	b=fV+TBMs12eBrXshcSAo7Nlo/1ZqFQ2VhppsnLgThRF+Rq1FaRlSKxPCFzsccjdWdx
	 3OBfQ51KsdGKQKEn5Eg3Ki5fHZA2khcz9bOkl+KmT362vnoBFdWHFzHw3T7yQOmLbZ
	 kY2BWlw1QMZI04xWY7wvUsJ3eSNsJHcoiwv0L2tM14tcCxHpZrBDzgayvo2Lulx9Zf
	 uRqEsia7RjkN41cDzL+Ch4vffuQ/wY5ZAGtYNamTxK19AsPUR63ITIrMv5feWc1NYd
	 bE6D77vPG8XJmv1UGssO3Ae6kmgsVDFVfoztAjQyfP/NbDeI2Sy6F096qNOEgJX2f2
	 E7Wvbm9lc0yUA==
Received: from [192.168.1.26] (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-tydg10021701.me.com (Postfix) with ESMTPSA id 13A6B3A141D;
	Mon,  8 Jul 2024 11:55:31 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Date: Mon, 08 Jul 2024 19:55:02 +0800
Subject: [PATCH b4] docs: Correct explanation for option -m of b4 diff
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240708-fix_typo-v1-1-23fd72aad8c3@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAJXTi2YC/x2MQQqAIBAAvyJ7TjATrL4SEVuutZcKjSjEvycdh
 xkmQaTAFKEXCQLdHPnYC9SVgGXDfSXJrjBopY2yqpWen+l6z0M6bLrOo0XSCCU/AxX3rwaYDYw
 5fxENTFReAAAA
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Zijun Hu <zijun_hu@icloud.com>, Zijun Hu <quic_zijuhu@quicinc.com>
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: icQwgv08DXiiHBbsYLNikd4mH4y6m3IO
X-Proofpoint-GUID: icQwgv08DXiiHBbsYLNikd4mH4y6m3IO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-08_07,2024-07-05_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0
 mlxlogscore=867 mlxscore=0 suspectscore=0 adultscore=0 clxscore=1011
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2407080092
X-Apple-Remote-Links: v=1;h=KCk=;charset=UTF-8

From: Zijun Hu <quic_zijuhu@quicinc.com>

For b4 diff -m AMBOX AMBOX, its explanation wrongly says that AMBOX is
prepared by git am, fixed by using b4 am for its explanation.

Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
---
 docs/maintainer/diff.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/maintainer/diff.rst b/docs/maintainer/diff.rst
index 43c29982bc24..e6ba12ef1caf 100644
--- a/docs/maintainer/diff.rst
+++ b/docs/maintainer/diff.rst
@@ -39,7 +39,7 @@ Optional flags
   ``git-range`` flags to use.
 
 ``-m AMBOX AMBOX, --compare-am-mboxes AMBOX AMBOX``
-  Compares two mbox files prepared by ``git am`` instead of querying
+  Compares two mbox files prepared by ``b4 am`` instead of querying
   the public-inbox server directly.
 
 ``-o OUTDIFF, --output-diff OUTDIFF``

---
base-commit: 131835a44c63511e2def9d7adc680754b7ea502c
change-id: 20240708-fix_typo-da399fa7ae2a

Best regards,
-- 
Zijun Hu <quic_zijuhu@quicinc.com>

