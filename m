Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83159399CE9
	for <tools@linux.kernel.org>; Fri,  9 Oct 2026 14:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791556591; cv=pass; b=ifUpOpmrI3QXwN7pTABYCh/qq23oRu/1QkMpkpMnlhWvYc4sV8QJzsfZMv7WXhiKP8zSsCQw/X79vYmSNKZ9XyU8P/HzrFsJWeoE/l6B+ordFEdc5ecfRVrxz8QqfBojUGvjE70TI4tDh5PbyOHr601BivKdqiQsEs08bHii5Y8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791556591; c=relaxed/simple;
	bh=7PwXsiZhOfltXOUlngVCxXMmExrVanO48weZsF3OGJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E1hqxK6WQoJgmwgQcTsg0XeD3yW9A13L92fmda1Llvog7uOfUkASGOC9DGb2DthQxGOCWMjB6EZBM3v6+NVzCwmpk5cfWkkpQ6k6QnOpSQrNvnbvZ5EWgiwIe3ViLFNsLBKUBZmO7+xZ2xJd2CkFeuVXEZxRAx6szVPD1e+9asY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jIH2VDyg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ePEMvDCa; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jIH2VDyg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ePEMvDCa"
Received: by smtp.kernel.org (Postfix)
	id 70C121F00898; Fri,  9 Oct 2026 14:36:30 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791556590;
	b=Vo6ccSVz+3NOMm3tJe32foXxH1llS/qjiJ79trkLSVEqJXVJAJh+1BLVLYzgH+JMeFPm
	 n1n4OEzvnwCeNyKKQp873mR9QOMbVPkPSn+mOhFhxxsNZXHxk8gZcJ0dwemYHlLXlPjd8
	 P6TZeIpNx3CPIHQggZAFtEO016jkPGXHrxpnDwYCMEGuxMUQnjyi9bK/YffvtCFd0jyUf
	 p4lyhmKb9tAL8/MOM7lU0jPRvrnGZEauUs3OZPX6hwONRDoF284UJ5u86sq+ESaWRpTIX
	 JgNOVuZRBr4DrHqOlzRMYwpzAyZ00WL+mocjMTnCW/lIWZYEge0iZgXlkxs4MOV/AZA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791556590;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=eqgNlyXCpZkiBCS8c0QZloB/OCWsfZqf/7Nxo1/A+mg=;
	b=NXTZZIqzWz70P+giVsaCewyV0rEkR28QKoDOqufN0i7KYCfiVm8D1zPc1ExND9zCqgig
	 Dp9xZ4iTTqo8kLBOU8q2rb6M1mga/3VRmcTld6qSzKGNSSblR70elskQNgumzAyFVZbzN
	 lUOwIWVRJo7aT/SgSM25nvv9p4Whp+RwZjtVs+ieAXGEn9XmGr3lcjAPKE7E/ZyW5PImD
	 80wihEGOSBOvUxcdcJqoHGVc7QxYBk5gOuqhtUo6TQHFxI152p7tb/IIaVH8WF+YFI3TN
	 FpE/0IQzuM8sSJD4KF4jN1s5L4I8YrQ35wxK2SQP6Q/cE3QDPqgvC58KtzQXa1+rLQw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jIH2VDyg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ePEMvDCa;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B76FE1F00893
	for <tools@kernel.org>; Fri,  9 Oct 2026 14:36:29 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jIH2VDyg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ePEMvDCa
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org B76FE1F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699DKieU887867
	for <tools@kernel.org>; Fri, 9 Oct 2026 14:36:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=eqgNlyXCpZkiBCS8c0QZloB/OCWsfZqf/7N
	xo1/A+mg=; b=jIH2VDygBzzbGFh1PYnSENKw3Fddg2EzYw4rqWVFAkgpLVGiEqE
	kIsDobKOKtsz5egENrZeNAwZILYhY5QuqGRRXDFPbazMOHto/+pkOljRqursldSz
	eltdHhM6axUlYWhBPFxO3hBVAUZz8tiXuphR8v46cy37JyAJLEHsnBKYIqU6UIqa
	wt+mPz61y6QkFejoai27Hx95rJTijcIXy6bcWyTpp8ij7cO3shfQLVhfmD7sG9a9
	Ay2YWcCQ8dura1LteTPNakpBq/rytyk3Ne2eHLGrONqHb3PcZMOJHgKF47Tbyv3t
	69d7dV3jZpTg1uXVmhQ9bp9A8hXvaAWQHMA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxu3xcu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <tools@kernel.org>; Fri, 09 Oct 2026 14:36:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb93c874bso418030285a.0
        for <tools@kernel.org>; Fri, 09 Oct 2026 07:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791556588; x=1792161388; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eqgNlyXCpZkiBCS8c0QZloB/OCWsfZqf/7Nxo1/A+mg=;
        b=ePEMvDCae7/uATjBIklnrGQ8BYuUXegw8RdF+TX5VH9TYbbI+936LzpDilsrbKlzbN
         ZAHS60GZRqCsNRqFKRK0b2T8/VKUj1rmOKKNK3c0oEnSYyJWz4B+T3VomJoU4uk2P9VK
         vXumPlL5hPC5slUoLDAmm/MZTqfVMrPmPHetAwdtbEIZpyTSLMiHZENXxmF9UfFz0QQR
         dJNkNyEdqk5yvgowQczbzx/evoQCV8KBXO6PISDYOG2L9M8lQEPxts8H6s3BRkf7YemL
         2jELppZ7j8aKA+RbMWItNTzRu5C4OFCE1qzhG6YeNpK31Xdx/E8jekw1s/+RUhIxoBw/
         MQqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791556588; x=1792161388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eqgNlyXCpZkiBCS8c0QZloB/OCWsfZqf/7Nxo1/A+mg=;
        b=lKBRyZtawY1oYN8Ymgo5OdZSiqXppDRtcSPy24PxjcLN51KNcXw+wu8Djcgk7aECh+
         Iqwp9fYFnLEnzzOpYAsPcyMt/DOw9X4D6GSyEmlkQNi2aRDhmAXMr9TM9wxTKlDc6AEv
         FdvD0AwWdG7ZU8hCJMbGDVU0jX5wdMunajD1Cpp7iswZdUwHFzDRJ3keqA9vPL3oM/Lg
         +qyuu7ntZVEFwYxsYBv5e4B48324335OGp5E0eKpv6Fn6prgENwwicg0s8FGaxa9jTex
         ibY7GfLUM9d8ukvxvHX9Leg6Vr0omz+g1/3Sd4B73qzQXTM4yXvH+IXmX5JwapbnW4/W
         MIAA==
X-Gm-Message-State: AFuF++mMRW4bsgLCHpm1ltz+tHHxQBsoDq9MuMSaYWzmHtMi1BHL5CRw
	HeNOsMZT3m7U/z4rE4elqbZCvHbayilQbIGHKBRvfLwbhZwJHAH7MTaYCRE4zKFZ0SGb2WjxSnV
	3CKP8rnKN6r6MiQ7PGaxMtBscXyQduMzAiVZubekC8Oy9i9hRGGBS7YzgdSQ=
X-Gm-Gg: AYBFou3giDb9vYXH7G/+AH8B1+JdR3Xlz5EYvn9Qyq68+Nr1GdIo263aAL5AXkTOgtt
	7bYmeaoCbxs36MJ24ZrSBvn/eRyoB1todaM+uoEQEjTlZpWz7uylaNrKCwyNhyVKrGg9JXuprm+
	vJcdhZuJ/Trfs69eNaRLvmX7r0ARTkTBOmne+Odv1/AyoUj26bXGdJ+6fQQIWA9ooqqv8iwvf3g
	Kk3IGgbKe4/bDzx8iklUriGIFu7X2wbqAvdfFSJxo3Xv8zeeIsgF1pEaQUZMrBDhIJwaTxeVwNN
	2fULuLELRnABBf8oRugn0SjGSPuYxuVVoINcdkrFT7yj0whHfQY2geRylwljGgKnlDe9wt06/U2
	1Ksq5ka6su/tu90s=
X-Received: by 2002:a05:620a:c86:b0:93e:c12d:4eca with SMTP id af79cd13be357-93ec12d54d5mr138909785a.42.1791556587807;
        Fri, 09 Oct 2026 07:36:27 -0700 (PDT)
X-Received: by 2002:a05:620a:c86:b0:93e:c12d:4eca with SMTP id af79cd13be357-93ec12d54d5mr138906285a.42.1791556587280;
        Fri, 09 Oct 2026 07:36:27 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ae25easm4274240f8f.59.2026.10.09.07.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 07:36:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: tools@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] trailers: Skip testing of Documentation
Date: Fri,  9 Oct 2026 16:36:20 +0200
Message-ID: <20261009143620.309848-1-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA1OCBTYWx0ZWRfX8tqXNeYAmxmw
 io1joVBZ7TTiUMioBz+ia2uibY36K/9KvFHRvVeiORP86L+Fg96oWWvPlLsdIeUL1AajaLCrvBK
 /gEuW8ThuWOabVupA779lnXMLCmlVv1WQudAKndqIPEb98nrG1qvdIr4QtbJRt5PP216GhwCYak
 ndvygeZcQ6V5y86LmUw27+erj3dri65YsWOmloFDWZR0Vb6IdDkipIa7ZC/0iqBDZsE9pNgFxb7
 BUlGnmAZH/Bc6e0wMsztpwjLkoOwV0D2rsbfGHJsPRMYuyFfBDjKO+I7tbWUoQD9oHVE7d8vDVu
 xH7obvteO+6C42fJ6sTFLNLVyzZAyCLNJVbgRFi9O5xeFVDRXAAsvHMosor3Jf914wjcy7t3GuU
 JpolfBaps9o1I2DqNkHahfJF1/GZwp8zvBxAGMlbT63s+u83Fq5I8xlFGXtmCj9rgPCAMJdedl8
 ZjfHPae/FKrHIz4n+8w==
X-Authority-Analysis: v=2.4 cv=QbjzLcbv c=1 sm=1 tr=0 ts=6ac8fbec cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=A1X0JdhQAAAA:8 a=qXXcUV81FgJP42AmmqAA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: rh7SdjER5z4uDQhjRuo6WzDdTg1swdVO
X-Proofpoint-ORIG-GUID: rh7SdjER5z4uDQhjRuo6WzDdTg1swdVO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA1OCBTYWx0ZWRfXwfFIyuLz2RFR
 XZ2kqyLDMPfnvRG34X23OKNiXrNWgn7UuTDO+rtLhfGDjcK1OCkqMebXNKcM6G99qkrjroFICnH
 6ofNtZgOlEOJQQ8OIT9bb0hqAtGX31A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1011
 bulkscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090058

Documentation patches cannot be tested, at least in Linux kernel
project, because that part of code is never executed.  Documentation
can be build-time validated, e.g. Devicetree bindings can be checked
with 'make dt_bindings_check, but this is not testing how Linux kernel
understands the testing.  Just like build testing is not testing.
Otherwise every bot should receive credits.  However people often give
blanket tags on cover letter without understanding that it does not
really apply.

Drop the "Tested-by" trailer for patches which have "Documentation"
path, to avoid misleading (or fake-crediting) testing annotations.

Assisted-by: LLM
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

This is vibe coded, and might be close to slop, but it seems it works
and looks reasonable good to my (inexperienced in b4 codebase) eye.
---
 src/b4/ez.py         | 17 +++++++++++++++++
 src/tests/test_ez.py | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/src/b4/ez.py b/src/b4/ez.py
index fab5540e0f15..b14483d60cb7 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -1751,6 +1751,20 @@ def interactive_trailer_review(
     return new_updates
 
 
+def _skip_trailer_for_patch(
+    lmsg: b4.LoreMessage, trailer: b4.LoreTrailer
+) -> bool:
+
+    if trailer.lname != 'tested-by':
+        return False
+    paths = {
+        path
+        for old_path, _old_hash, new_path, _mode in lmsg.blob_indexes
+        for path in (old_path, new_path)
+    }
+    return bool(paths) and all(path.startswith('Documentation/') for path in paths)
+
+
 def update_trailers(cmdargs: argparse.Namespace) -> None:
     if not b4.can_network and not cmdargs.localmbox:
         logger.critical(
@@ -2065,6 +2079,9 @@ def update_trailers(cmdargs: argparse.Namespace) -> None:
         parts = b4.LoreMessage.get_body_parts(lmsg.body)
         midmask = str(config['midmask'])
         for fltr in lmsg.followup_trailers:
+            if _skip_trailer_for_patch(lmsg, fltr):
+                logger.debug('  - %s (Documentation patch)', fltr.as_string())
+                continue
             if fltr not in parts[2]:
                 rendered = fltr.as_string(omit_extinfo=True)
                 via_msgid = fltr.lmsg.msgid if fltr.lmsg else ''
diff --git a/src/tests/test_ez.py b/src/tests/test_ez.py
index 0aa89c66b6c5..2da141a4e978 100644
--- a/src/tests/test_ez.py
+++ b/src/tests/test_ez.py
@@ -186,6 +186,39 @@ def test_trailers(
     assert logstr == cstr
 
 
+@pytest.mark.parametrize(
+    'paths, trailer_name, expected',
+    [
+        (['Documentation/foo.rst'], 'Tested-by', True),
+        (['Documentation/devicetree/bindings/foo.yaml'], 'Tested-by', True),
+        (['src/foo.c'], 'Tested-by', False),
+        (['Documentation/foo.rst'], 'Reviewed-by', False),
+        (['Documentation/foo.rst', 'src/foo.c'], 'Tested-by', False),
+    ],
+)
+def test_skip_tested_by_for_documentation_patches(
+    paths: List[str], trailer_name: str, expected: bool
+) -> None:
+    msg = EmailMessage()
+    msg['Subject'] = '[PATCH] test'
+    msg['From'] = 'Author <author@example.com>'
+    msg['Message-Id'] = '<patch@example.com>'
+    diffs = []
+    for path in paths:
+        diffs.append(
+            f'diff --git a/{path} b/{path}\n'
+            'index 1111111..2222222 100644\n'
+            f'--- a/{path}\n+++ b/{path}\n'
+            '@@ -1 +1 @@\n-old\n+new'
+        )
+    msg.set_payload('\n'.join(diffs))
+
+    lmsg = b4.LoreMessage(msg)
+    trailer = b4.LoreTrailer(name=trailer_name, value='Tester <tester@example.com>')
+
+    assert b4.ez._skip_trailer_for_patch(lmsg, trailer) is not expected
+
+
 # ---------------------------------------------------------------------------
 # Tests for pre/post-rewrite hooks
 # ---------------------------------------------------------------------------
-- 
2.53.0

