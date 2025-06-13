Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F7A2F5302
	for <tools@linux.kernel.org>; Tue, 17 Jun 2025 22:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750197877; cv=none; b=LfOyyP72fHtXKETrSZ+g0hZnQJqiiJ3xw+o8+Nlw0qoas1C/jiHwFGZiqNAEIbuDyma2drlbIEQuSDnfdq5y/Zw8407lwZaUapkAp+c2pcmSKmtACOvAjwh/ZHhPQyw62oag/f6tsrMqFNUKoSd8hUkioSyo0PNq6ssB2VP01RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750197877; c=relaxed/simple;
	bh=79Nix+61J98MySaGkX3eJFlO5Pq2lR91VkHJZVN9Gbs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tYFQiqkT51p5BsFoSnVDflan1EaCcrWVT8wHtLmba+oyK245pIPLB1cg9/tJKB6bLGCQaEVc/mZ2u0gcOU+Os72SdJKszYXG84Qjom3V9yi2HMq5brGAqhTGQ7CR2q/BQT4XIQW4St+4HSICS3ARH3v0vOSTb+J36U1CxTb6VtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=MBPSmNtn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="MBPSmNtn"
Received: by smtp.kernel.org (Postfix)
	id 40D4DC4CEED; Tue, 17 Jun 2025 22:04:35 +0000 (UTC)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E6BC8C4CEE3
	for <tools@kernel.org>; Tue, 17 Jun 2025 22:04:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E6BC8C4CEE3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55HFjc0k001838
	for <tools@kernel.org>; Tue, 17 Jun 2025 22:04:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:resent-date:resent-from:resent-message-id
	:resent-to:subject:to; s=pp1; bh=g1mkPowfQdMuPhzm6x6YDOhdYp23ycE
	Gq+NEqvSKY8g=; b=MBPSmNtn5Ua4zMzc+R6HlydfwImYEUSoiV319DxSVVMyk27
	ucwz6VQK58AxQevuwGg67r6QhnBUflpiyGOfD3tge15v7CWkEfVRSZmJvERrrXdv
	0v0F8RBcF7e3v3sLXmvKVx3NQeHXcAptYb9jIpgvUrZrNrv28UudTEC6fo7A2mo8
	W6M2lZuLJ2RV1idE/3l/CDWbSXHt8yhUYgVOnJFDWxOEBRBzn/VWNowjvAH+Gct+
	dRW0QTNsLlFJ5pT0puF/BXIerysQKiFfdPxhw6MxbJ+6oCK4AXhUjxBMiRh7ctl0
	CCh4m7i6KFGbyT0WTfquTnvlLQ/OlezMFvrQIVQ==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4790r22nk3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <tools@kernel.org>; Tue, 17 Jun 2025 22:04:32 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55HLH6ps014278
	for <tools@kernel.org>; Tue, 17 Jun 2025 22:04:31 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 479p42de2f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <tools@kernel.org>; Tue, 17 Jun 2025 22:04:31 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55HM4VG729885048
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <tools@kernel.org>; Tue, 17 Jun 2025 22:04:31 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E943A58054
	for <tools@kernel.org>; Tue, 17 Jun 2025 22:04:30 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BE4C25803F
	for <tools@kernel.org>; Tue, 17 Jun 2025 22:04:30 +0000 (GMT)
Received: from d.ibm.com (unknown [9.61.1.170])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTPS
	for <tools@kernel.org>; Tue, 17 Jun 2025 22:04:30 +0000 (GMT)
Resent-To: "Kernel.org Tools" <tools@kernel.org>
Resent-From: Dave Marquardt <davemarq@linux.ibm.com>
Resent-Date: Tue, 17 Jun 2025 17:04:30 -0500
Resent-Message-ID: <87a566dnyp.fsf@linux.ibm.com>
Received: from ltc-imap-p9a.rchland.ibm.com ([unix socket])
	 by ltc-imap-p9a.rchland.ibm.com (Cyrus 3.0.7-27.el8_10 Fedora) with LMTPA;
	 Fri, 13 Jun 2025 14:04:08 -0500
X-Cyrus-Session-Id: ltc-imap-p9a.rchland.ibm.com-1026582-1749841448-1-12151406766046326140
X-Sieve: CMU Sieve 3.0
Received: from localhost (localhost.localdomain [127.0.0.1])
	by ltc-imap-p9a.rchland.ibm.com (Postfix) with ESMTP id 87167818DB287
	for <davemq@imap.linux.ibm.com>; Fri, 13 Jun 2025 14:04:08 -0500 (CDT)
X-Virus-Scanned: amavis at linux.ibm.com
X-Spam-Flag: NO
X-Spam-Score: 0.001
X-Spam-Level:
Received: from ltc-imap-p9a.rchland.ibm.com ([127.0.0.1])
 by localhost (ltc-imap-p9a.rchland.ibm.com [127.0.0.1]) (amavis, port 10024)
 with LMTP id AetgjyYHeEFC for <davemq@imap.linux.ibm.com>;
 Fri, 13 Jun 2025 14:04:07 -0500 (CDT)
Received: from mx1.linux.ibm.com (ltc-mx1-p9a.rchland.ibm.com [9.5.196.147])
	by imap.linux.ibm.com (Postfix) with ESMTPS id F10118187E1FF
	for <davemq@imap.linux.ibm.com>; Fri, 13 Jun 2025 14:04:07 -0500 (CDT)
Received: from smtprelay04.dal12v.mail.ibm.com (unknown [9.208.130.102])
	by mx1.linux.ibm.com (Postfix) with ESMTPS id B56F5205271
	for <davemarq@linux.ibm.com>; Fri, 13 Jun 2025 14:04:07 -0500 (CDT)
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com
 [10.39.53.230])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 55DJ46Zg22413978
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Jun 2025 19:04:07 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BB9265805D;
	Fri, 13 Jun 2025 19:04:06 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8549758054;
	Fri, 13 Jun 2025 19:04:06 +0000 (GMT)
Received: from d.ibm.com (unknown [9.61.41.78])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 13 Jun 2025 19:04:06 +0000 (GMT)
From: Dave Marquardt <davemarq@linux.ibm.com>
Date: Fri, 13 Jun 2025 14:04:05 -0500
Subject: [PATCH b4] Create temporary directory in current working directory
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250613-fix-magit-edit-v1-1-7c85ecc6333a@linux.ibm.com>
X-B4-Tracking: v=1; b=H4sIACR2TGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDM0Nj3bTMCt3cxPTMEt3UFCBhYmmYmpaYnGxumGipBNRUUJQKVAE2MFo
 pyUQptrYWAMdvz/xkAAAA
X-Change-ID: 20250613-fix-magit-edit-491efacc71a9
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Dave Marquardt <davemarq@linux.ibm.com>
X-Mailer: b4 0.15-dev
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: oy6CedJyOKXXMnTeHK45EMWmJVDZDk5x
X-Proofpoint-ORIG-GUID: oy6CedJyOKXXMnTeHK45EMWmJVDZDk5x
X-Authority-Analysis: v=2.4 cv=AqTu3P9P c=1 sm=1 tr=0 ts=6851e670 cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VnNF1IyMAAAA:8 a=_nfwnCaU8BGYFbgPya0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDE3NSBTYWx0ZWRfX8s2AePpQhiVh OTR5u2R6LeCMJtiLpe0cMOMXlrrr268//RjNMt5K/ZK0XYaCqusGerkMwIlGrFfTN8iwX2YpXD9 yr0acwTAnLRAvMa9lllJcgBo9gt7LrQTg2OgtHsxOlBwnSqzBdrgSz4xwtUbcwN590QUOmY3ORI
 jwxDc1cnW9l5brwbmYJeav3Z5WyM6xBtHG0Yn5R9wMiPEkdxyhftABPBHMnWbOb0Fdhcn/udl+Y vmdAnP+znx2aD35mltZSMbnX4evFlGx0s3pWyxG/WOpM6Uf0J536mZa6SZOtCeDbrLqc3mEgnkd 1cECB89PT5tx/N+5ciO/YZcf126xOzR6U5b9E86f9Rbn7T9VhHjmH2pWJ0y1BScAvpprvM0BdRT
 jPvuczZbZ1WtT+unJDJMDCAQh90lwvQvrvQfGA/G2EPjCoImOFCXakwr/H4tNtegnTAZNuUL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_09,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=828 mlxscore=0 spamscore=0
 bulkscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506170175



---
In edit_with_editor, create temporary directory in current working
directory. This avoids issues with Emacs and Magit, which insists
COMMIT_EDITMSG must be in the repo's directory tree.

Signed-off-by: Dave Marquardt <davemarq@linux.ibm.com>
---
 src/b4/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 0a7daec..79d695a 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -4423,7 +4423,7 @@ def edit_in_editor(bdata: bytes, filehint: str = 'COMMIT_EDITMSG') -> bytes:
     editor = corecfg.get('editor')
     logger.debug('editor=%s', editor)
     # Use filehint name in hopes that editors autoload necessary highlight rules
-    with tempfile.TemporaryDirectory(prefix='b4-editor') as temp_dir:
+    with tempfile.TemporaryDirectory(prefix='b4-editor', dir=Path.cwd()) as temp_dir:
         temp_fpath = os.path.join(temp_dir, filehint)
         with open(temp_fpath, 'xb') as edit_file:
             edit_file.write(bdata)

---
base-commit: 220ba25f86b6f295eab8b4e9e67b624e460f0126
change-id: 20250613-fix-magit-edit-491efacc71a9

Best regards,
--  
Dave Marquardt <davemarq@linux.ibm.com>

