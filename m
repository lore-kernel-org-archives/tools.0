Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B7E1C6A7
	for <tools@linux.kernel.org>; Thu, 27 Jun 2024 17:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719510200; cv=none; b=Dn0izs8Xhl3GdPRCAgKiMWT3WG9hQlNfaF3HDtMmplZUVaGOARb/Op5s+UHADESmlG3IsoBeSQThrz2SAHy8aJGLJjvPZaDvYZQ/BiI/u94g0i2YUQoc8fSmaB7Z3nf8tzH1OnCzY40c+SljQ3lu6/5QKwbY6b/7QoKtYWJTCNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719510200; c=relaxed/simple;
	bh=NHzJn8p/4YkpeW3OTAj5tgogw95Uib8FfUsLmZWxrj4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=X9k4tyOpMYMTp+L/MO/OGei+OjmZ3l6UMPrCSWtjk/9tRIbwiZ30KEkE8iS0pU5AUklUlithGu/NJMyLQWdoiFhoQaCJgqAYwRBfYPEseuFGv8i88xGoomfi8PinE9K0mJjqL0Ck1HC3jmqV+pVCjNMxJDXjeEugowzPAcuBLQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com header.b=CLxdQ9fm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com header.b="CLxdQ9fm"
Received: by smtp.kernel.org (Postfix)
	id A5FC2C4AF07; Thu, 27 Jun 2024 17:43:19 +0000 (UTC)
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com [67.231.144.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8E6A4C2BBFC
	for <tools@kernel.org>; Thu, 27 Jun 2024 17:43:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8E6A4C2BBFC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=collins.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collins.com
Received: from pps.filterd (m0346906.ppops.net [127.0.0.1])
	by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 45RFJMl5025867;
	Thu, 27 Jun 2024 17:43:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : message-id :
 mime-version : subject : to; s=POD051818;
 bh=9o3pqlKJKrFrMGzuILBgZEaHbbSKhaILOLepf3HbKe0=;
 b=CLxdQ9fmiVL8e4lxH/+NPjXMlHUb1sDCdLXcvGnjqhkNAsKMSSSfe00bfD89eJ1OrZ+m
 L3tl5BYe8IsDt+ScCEU1kk1M1w7hFasWHyrVnWL3hNklVmCsxcfEVQ3BAHQXHrgR9mIN
 SL3i/DxJowx40vrIzRstwX40OLuCf7p2MknoC3m2iP06xt9lNdDc3+2uesphwCYucbNj
 SuibT6LKgyZbWXCvUm7u2XR+kUIFwjdMyoTL6wDvvRl4m1dPrbv2jd51rz35gzXXL+D+
 kwBYdhcbSnOF3zc5uAruoc59yaxXr5W8TEo/VwRSR8DeAEpJGAj09z3l6uCE+WiGqtHW xA== 
Received: from xusxph008rp050.rtx.com (xusxph008rp050.rtx.com [128.13.124.147])
	by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 401amd9svs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Jun 2024 17:43:11 +0000
Received: from xusxph008rp020.corp.ray.com ([128.13.124.224])
	by xusxph008rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 45RHgm6R004231
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Jun 2024 17:42:48 GMT
Received: from ciulimr02.rockwellcollins.com (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
	by xusxph008rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id 45RHgmhC001074
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 27 Jun 2024 17:42:48 GMT
X-Received: from localhost (unknown [10.148.204.208])
	by ciulimr02.rockwellcollins.com (Postfix) with ESMTP id 305981002686;
	Thu, 27 Jun 2024 12:42:48 -0500 (CDT)
From: Brandon Maier <brandon.maier@collins.com>
Date: Thu, 27 Jun 2024 17:42:37 +0000
Subject: [PATCH b4] docs/config: document how *-cmd is run
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240627-check-cmd-docs-v1-1-e548ff7ede5d@collins.com>
X-B4-Tracking: v=1; b=H4sIAIykfWYC/x3MQQqAIBBA0avErBsoscSuEi1snGqINBQiiO6et
 HyL/x/InIQzDNUDiS/JEkNBW1dAmwsro/hiUI3STa8M0sa0Ix0efaSMxtrWdM4urD2U6Ey8yP0
 PR5g1TO/7AXczMopkAAAA
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Brandon Maier <brandon.maier@collins.com>
X-Mailer: b4 0.14.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_13,2024-06-27_03,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_13,2024-06-27_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 suspectscore=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2406270132
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2406270132
X-Proofpoint-ORIG-GUID: u_tHPqQGSLmd9Rk-BpRHSjA9k88Vog5c
X-Proofpoint-GUID: u_tHPqQGSLmd9Rk-BpRHSjA9k88Vog5c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_13,2024-06-27_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam policy=outbound_default score=0 mlxscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 impostorscore=0 mlxlogscore=999 priorityscore=1501 phishscore=0
 malwarescore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2406180000 definitions=main-2406270133

For someone not familiar with checkpatch and get_maintainer's flags,
it's not obvious how the commands are used. Document this to help users
trying to add custom checkers.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 docs/config.rst | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/docs/config.rst b/docs/config.rst
index c49f5d2..da58534 100644
--- a/docs/config.rst
+++ b/docs/config.rst
@@ -161,9 +161,11 @@ These settings control ``b4 am`` and ``b4 shazam`` behavior.
   Default: ``None``
 
 ``b4.am-perpatch-check-cmd`` (v0.14+)
-  The command to use when running with ``--check``. If b4 finds
-  ``scripts/checkpatch.pl`` at the top of your git tree, it uses the
-  command shown below by default.
+  The command to use when running ``--check``. The command is run once for each
+  patch to check. The patch file to check is piped through stdin. If this
+  config is defined multiple times, all commands will be run. If this config is
+  not defined and b4 finds ``scripts/checkpatch.pl`` at the top of your git
+  tree, it uses the command shown below by default.
 
   Default: ``./scripts/checkpatch.pl -q --terse --no-summary --mailback``
 
@@ -379,14 +381,18 @@ Contributor-oriented settings
   Default: ``no``
 
 ``b4.send-auto-to-cmd``
-  The command to use for obtaining the list of "To:" recipients. Has no effect
-  if the specified script isn't present in the repository.
+  The command to use for obtaining the list of "To:" recipients. The command is
+  run once for each patch in the series. Each patch file is piped through
+  stdin. If b4 finds ``scripts/get_maintainer.pl`` at the top of your git tree,
+  it uses the command shown below by default.
 
   Default: ``scripts/get_maintainer.pl --nogit --nogit-fallback --nogit-chief-penguins --norolestats --nol``
 
 ``b4.send-auto-cc-cmd``
-  The command to use for obtaining the list of Cc: recipients. Has no effect
-  if the specified script isn't present in the repository.
+  The command to use for obtaining the list of "Cc:" recipients. The command is
+  run once for each patch in the series. Each patch file is piped through
+  stdin. If b4 finds ``scripts/get_maintainer.pl`` at the top of your git tree,
+  it uses the command shown below by default.
 
   Default:: ``scripts/get_maintainer.pl --nogit --nogit-fallback --nogit-chief-penguins --norolestats --nom``
 
@@ -426,9 +432,11 @@ Contributor-oriented settings
   Default: ``None``
 
 ``b4.prep-perpatch-check-cmd`` (v0.14+)
-  The command to use when running ``--check``. If b4 finds
-  ``scripts/checkpatch.pl`` at the top of your git tree, it uses the
-  command shown below by default.
+  The command to use when running ``--check``. The command is run once for each
+  patch to check. The patch file to check is piped through stdin. If this
+  config is defined multiple times, all commands will be run. If this config is
+  not defined and b4 finds ``scripts/checkpatch.pl`` at the top of your git
+  tree, it uses the command shown below by default.
 
   Default: ``./scripts/checkpatch.pl -q --terse --no-summary --mailback --showfile```
 

---
base-commit: 131835a44c63511e2def9d7adc680754b7ea502c
change-id: 20240627-check-cmd-docs-799175a9fe4d

Best regards,
-- 
Brandon Maier <brandon.maier@collins.com>

