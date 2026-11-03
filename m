Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793713220;
	b=cErNshPFILT5Flp9vQpx1QZqxXn2J4ASu35eJGyfgq+9wJ4lbuSgYqq/RLgy+8gNQDjH
	 KRWq8ES1qfeZiQZyvDHYYWJbLmbL+H7OBGCz6ELXDgGoJ50W7rMmQ/JgAxdpvlJC2zIiI
	 NeRVeU1tqgMvoiUVbQ+bdby0+UgDdDwWidA8SSUcawKVueP3jGi7GaBKDjDTpPBCcR7lV
	 pfA5b7VgI1AQrSO4Cgc0svJMqJoyb/sYPTavNTTcuJUomtbq1vvSxtlpFZ2OQJ2m+jmpP
	 itxVWYrhSou3GieKz8fyNDT85wugNLgh0iNYW8ofjozPj1G98dhu056rU5A88m5JUZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793713220;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:DKIM-Signature:
	 Received:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CdU/xZiE8GGmMNm4gWpBiWqp92ot09ZXqqgOBU1m13k=;
	b=wvGXE7owJHX3TQZEf4rP5XO+TrT4MqDKXol+IeISzmtYerPUBAYHaXr/qS7cuBE6Pc31
	 gRpU269IVm9+McPthA79UvDIBQQ6ZPdWfHaZFXHz55X1vtlwyEqbPqJ8nWbSKWyn8359T
	 sL8HrhhpxwgjMoPg2bs/6ejKEXoeaZVQVtjBj9zVO4aaar4mSDyobgbwq4w5ZUw1+OjYd
	 rTouqRYiysM85y7giU0nRevYKru3aBEvVeVGC6xWBAmcoN19AhsiYUwevJcdeBU5U+4gK
	 K0VOtTN72U2BY2Bv0Bf3FH0v0kgiVYahq6fYe3u9e5+IAGRZD1NlrxnBPcpygwYGFYA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fj1Zxchw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TVfKdLH0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C808606A326
	for <tools@linux.kernel.org>; Tue,  3 Nov 2026 13:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fj1Zxchw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TVfKdLH0
Received: by smtp.kernel.org (Postfix)
	id C34C31F00919; Tue,  3 Nov 2026 13:40:19 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793713219;
	b=ngAcf6sqCgBAV1biBi4/jDM06JQuFOT9JlIYH6rDvLTGcrd1+sT5RT7BXwNXqr+IIKtw
	 7GeZGr/HbOJuL5QKuQbewOSNTJ5I30XpPegpTkAumkoNW6PfCuMaoWYxVHKTkxr0S5ptW
	 E2BbpSExnpkscRHE22zTPFBL4ZrE4JQOhLOhDIRjD6vr124h3luLNaXfG3YUM8ybjuUit
	 P/NE2nnswJdf6Eiie+mCZAIfpH30wfOTdIZyq8Zhe5jzNUdbzogEjhI4CZ6QysyC3zrYh
	 x7tYyTfpShxHxjueeH9ZTahs640chhi6tgdZBWMJy9/MbWqM6H/Ip7o3c1qdVdc4F/Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793713219;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=CdU/xZiE8GGmMNm4gWpBiWqp92ot09ZXqqgOBU1m13k=;
	b=Rb76Wi3b9w3gA3M1j4S7aGdcBEhNcv04bk1/82IfGhIlxaSy2I6FSHGEwEiuZRd3gP14
	 KafyLD7yfFX3y+vfT6VLjL56TMP/WlG31eKTXQ9moo6M5/+aTZ88SUF4qSf8KMRoFs5zS
	 gjs3lWP+f1E3Q6YmAfcBAdDnLMOsRVXpBt4f+Ni6mx2gh9LtpMcxaJMh7/Z3U4qNQObAU
	 5oap1HKaLy93CSv92B1q0qtFLazCDKIbdx5GQp1f+3BEcMmioUJXm6TGv75C0aemhUk6+
	 0BaPXIldGOYdMUFHpMgDNVcLFCrN2fNDmBj/FDy4KO4u4UBg5g6Xw4A0RLMrILcNLJw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fj1Zxchw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TVfKdLH0;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A04931F000C1
	for <tools@kernel.org>; Tue,  3 Nov 2026 13:40:18 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fj1Zxchw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TVfKdLH0
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org A04931F000C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3DZ8Tb3973655
	for <tools@kernel.org>; Tue, 3 Nov 2026 13:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CdU/xZiE8GGmMNm4gWpBiW
	qp92ot09ZXqqgOBU1m13k=; b=Fj1Zxchw5+wbjZ+hm/vxt9LfxZGj05wmojJD33
	O1rhltBXV5cTdpvAg+uNS/3WEQ1nPzjTX2oy8RVzvMW6LWvuhMAfhG7gS35Zd61e
	PTo3DOivjPGceAd2DooOfCc4TYPTMwTqLakuk4i65CPAbE5DTfoDxREj+3EwljmW
	HQgTznup8xQEYBsxd86GcuGiLnoS5VVwxT+ofbLRbQxUCLVUPK5yOVaWSrYM2CjB
	U72goNFuLdQTip4nff6TGWEGi9/cqcoJd7sbIZpIs3qr16wQiXp+dQeS+Wqa8SAD
	PA7q8r2a4YGXZNfvQQXSxeVeGJkaHdbjreKOG4aYmnHb8N5g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq3uy337r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <tools@kernel.org>; Tue, 03 Nov 2026 13:40:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53395d51187so48550781cf.1
        for <tools@kernel.org>; Tue, 03 Nov 2026 05:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793713217; x=1794318017; darn=kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CdU/xZiE8GGmMNm4gWpBiWqp92ot09ZXqqgOBU1m13k=;
        b=TVfKdLH0rdJ5/KeMUVSHIxqt1RRHHSZznbXStzJES8h/mv0Mlj1iI3uhaTqfsG+A5e
         aMjx92976KcNsCBwXYhpTUzAu15kTl+qdbS9Z6508lVbj/ww/MB3D9g/nDyl0/0hy28F
         FZv0R9LcndnsuR/8NRGYu50sOEJZ0rlAuhuIApMbWoedJ+qbXDq53JhNql9aMko3evdC
         htzFXEsimeqCzJ3KbpD3Dk0Bi9dc1iM21I7ZMwGg+zvoZAnTHsMrVoYvLqaz/bbOKvyr
         oTZOWTwtY7oW4A24Zl8uqJZsHzwH4y98uBBxQMCQprZopvzvG0MMs38knUkwwnoimRHQ
         0TMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793713217; x=1794318017;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CdU/xZiE8GGmMNm4gWpBiWqp92ot09ZXqqgOBU1m13k=;
        b=t8ybnMupu2zwugE/5qmCu+dZi0Df3GwXC2kBBh0FldSWw6XLbnmq1v2WL9g6lHjV9B
         5V7vsACd0qPclaKCx+KJ9vymO9nhTc5ysYZ2Vx7FurCTJM0ky/b7vUb4yt+nky0V3Uio
         xGUJbqmHEUA3Qhuf11PJFlw/71agiQMyul81uZoV8Ho/3yAv0qD2w4561jTjrYVSNPid
         2NP/ixJfLTohbDrL123Sx7LgA8ic/7khPvGKTvhhCp7AZfQ+jD9giCiBZDp+mTz4Acan
         efUjFJzw6SFjXGw7vD2R3J0ZCOAopctsCK0ZmMmgYqH/a133y9gqAMbMbg51+36qTnB1
         R6xA==
X-Gm-Message-State: APuU4Z/TwHO9y1Dcob5fKfxGop7Ss83+NXLP7GVlcADLmNVBH4kq3igr
	aiPJyI00kOn9wkZYCjslqDWQD++m+jruJw06c25XxOABpgc9Cqv2Tkfuyn5IdC3KjDKtwtfAnzr
	M2TpZF+EBnnRadT/j6mLLMuQkHz7a6QS5K8oLIUnBSHlURP286171uoeF/ls=
X-Gm-Gg: AYBFou3QowRIQdHNl/2Onqq7ROnhY2UZpZbr3fqH94bYooSxf4cmpGTuSTcPXXlbBTQ
	uGPTBpgtcYl1oPBdHiHlHRMmOcOyrzoGhlnNFqNyLzPBWTOpBJZFPK2/OwC3kDSfYDJvUfgBjGq
	/ABeZJg7GhhGBT0+CUOvmdY/C2J52SQ4+3rN8DoSKys8vRvly9lA5RC8qqTOVyc4PZsSOpPNxlF
	f5SE70TW52bjBWx3jwG6tFbACafNJgEjDQrEePNVe72n3KzIdDyfq7EV/E5Zv+j8p00JCM/4fnj
	oSeeLZn3xhosn1WIbcvtyKiHbFtP02iLxFaTNLlw4+myeNFb7UiLZc5q8L7gojT5G4C3P2dHM/N
	xH8udwCcT0Evncte6sLobdR7aMhNbFmp+igbZsORXS3WnDBfQBrLp89GtosbOUg==
X-Received: by 2002:a05:620a:4626:b0:93e:942f:b8ae with SMTP id af79cd13be357-94421659fafmr2168718885a.26.1793713216679;
        Tue, 03 Nov 2026 05:40:16 -0800 (PST)
X-Received: by 2002:a05:620a:4626:b0:93e:942f:b8ae with SMTP id af79cd13be357-94421659fafmr2168713885a.26.1793713216121;
        Tue, 03 Nov 2026 05:40:16 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a82cf248sm87646195e9.2.2026.11.03.05.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:40:15 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: tools@kernel.org
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH b4 v2] trailers: Skip testing of Documentation
Date: Tue,  3 Nov 2026 14:39:54 +0100
Message-ID: <20261103133957.239398-1-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: xatqkI8EJX4QDTG1kH94ingUpxTO2SJ9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1NCBTYWx0ZWRfX3v5j/hJyMbNu
 7J4wnR/t28PeGpDOrIHYhQ6AjE1/T345tsAAmvjPvnoohMXbO3DuadqfpZZlOxpuuvZjazcFwCH
 +nhd209pzk86RlTXbLM4RIYQTQh+9ZWOgAnvyz2IXtrsugiVjy6KwQzVowCMRbqNZgfJyhaiTvL
 EtkH2NivzHzONUuLkY7I+0Z3Vop9HXuNER0ztoS/MJHEE2xWmH1UmAKR+TD22vlGiGDsutyA91V
 H1ifUnjbrRDBZ6OWH0gCCqbIhYiS85WZhu54jWBXAUps65XRfYuVya6/mAtfjEybYy+GNs6vH34
 apDb5tiWTUU/5gwkDU7V3ppYRTm9twejZBIVF0CnogIvUAQ6tTCFlVKUuvdXFSMEKXA7W64tuQ+
 lDHGIpHip0pHSqWMTxfomoJ+NxgfF+JOv+Egm+TXT89PCP1NJg2XsWvCGYoLZ9hQBvj+OZoutLv
 FZeu5DryNvWWlWx0KYQ==
X-Authority-Analysis: v=2.4 cv=VoG2kO2n c=1 sm=1 tr=0 ts=6ae9e441 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=2V6DY6BgAAAA:8 a=A1X0JdhQAAAA:8 a=cTNnn_u2j2R5-SN4ySUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=ldqKKs2zR4t-S6fqr-1n:22
X-Proofpoint-GUID: xatqkI8EJX4QDTG1kH94ingUpxTO2SJ9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1NCBTYWx0ZWRfX9BuXk10vJcoc
 0tdSlEf88sae209R48oq/P1pOTlqeyMNJYs5UFF5EFIoM/250Pg6c4cNgluhKfOBA1mB7m5lWls
 V87uxjy2I8NxtN8RhH5kXzKEloDP6po=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030054

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

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Rebase - previous code stopped working...
2. Re-do and also apply this logic to `shazam`, not only `trailers`

This is vibe coded, and might be close to slop, but it seems it works
and looks reasonable good to my (inexperienced in b4 codebase) eye.
---
 src/b4/__init__.py         |  28 +++++++
 src/b4/ez.py               |   3 +
 src/tests/test___init__.py | 159 +++++++++++++++++++++++++++++++++++++
 3 files changed, 190 insertions(+)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 704ddec9b5c6..fcf4e075c753 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -238,6 +238,8 @@ MERGE_BASE_TAG = '_tag'
 MERGE_BASE_SPECIFIED = '_specified'
 MERGE_BASE_GUESS = '_guess'
 MERGE_BASE_MARKERS = (MERGE_BASE_TAG, MERGE_BASE_SPECIFIED, MERGE_BASE_GUESS)
+# Patches touching only these paths cannot be tested, so Tested-by is dropped
+UNTESTABLE_PATHS_PREFIX = 'Documentation/devicetree/bindings/'
 DIFFSTAT_RE = re.compile(r'^\s*\d+ file.*\d+ (insertion|deletion)', flags=re.M | re.I)
 # Body lines that mboxrd escapes by adding one more '>'
 MBOXRD_FROM_RE = re.compile(rb'^(>*From )', flags=re.M)
@@ -2180,6 +2182,25 @@ class LoreMessage:
                 self._blob_indexes = set()
         return self._blob_indexes
 
+    def is_untestable_trailer(self, ltr: 'LoreTrailer') -> bool:
+        """Tell whether *ltr* is a Tested-by for a patch nothing can test.
+
+        Devicetree bindings are never executed, so a Tested-by on a patch
+        touching only Documentation/devicetree/bindings/ credits testing
+        that did not happen.  Such tags usually come from blanket
+        Tested-by replies to the cover letter.
+        """
+        if ltr.lname != 'tested-by':
+            return False
+        paths = {
+            path
+            for oldpath, _ohash, newpath, _fmod in self.blob_indexes
+            for path in (oldpath, newpath)
+        }
+        return bool(paths) and all(
+            path.startswith(UNTESTABLE_PATHS_PREFIX) for path in paths
+        )
+
     @property
     def has_attestation_headers(self) -> bool:
         """Tell whether :attr:`attestors` would have anything to check.
@@ -3509,6 +3530,13 @@ class LoreMessage:
         if extras:
             new_trailers += extras
 
+        for ltr in list(new_trailers):
+            if self.is_untestable_trailer(ltr):
+                logger.info(
+                    '    x %s (bindings-only patch)', ltr.as_string(omit_extinfo=True)
+                )
+                new_trailers.remove(ltr)
+
         if sobtr in new_trailers:
             # Our own signoff always moves to the bottom of all trailers
             new_trailers.remove(sobtr)
diff --git a/src/b4/ez.py b/src/b4/ez.py
index 2441badbb288..80ab142aef57 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -2420,6 +2420,9 @@ def update_trailers(cmdargs: argparse.Namespace) -> None:
         parts = b4.LoreMessage.get_body_parts(lmsg.body)
         midmask = str(config['midmask'])
         for fltr in lmsg.followup_trailers:
+            if lmsg.is_untestable_trailer(fltr):
+                logger.debug('  - %s (bindings-only patch)', fltr.as_string())
+                continue
             if fltr not in parts[2]:
                 rendered = fltr.as_string(omit_extinfo=True)
                 via_msgid = fltr.lmsg.msgid if fltr.lmsg else ''
diff --git a/src/tests/test___init__.py b/src/tests/test___init__.py
index 764829d7e756..51db39ced370 100644
--- a/src/tests/test___init__.py
+++ b/src/tests/test___init__.py
@@ -900,6 +900,165 @@ def test_link_trailer_dedup(body_link: str, extra_link: str, expect_count: int)
     assert len(link_trailers) == expect_count
 
 
+def _make_diff(paths: List[str]) -> str:
+    return '\n'.join(
+        f'diff --git a/{path} b/{path}\n'
+        'index 1111111..2222222 100644\n'
+        f'--- a/{path}\n'
+        f'+++ b/{path}\n'
+        '@@ -1 +1 @@\n'
+        '-old\n'
+        '+new'
+        for path in paths
+    )
+
+
+def _make_lmsg(paths: List[str], body_trailers: str = '') -> b4.LoreMessage:
+    raw = (
+        'From: Test Author <test@example.com>\n'
+        'Subject: [PATCH] test\n'
+        'Date: Mon, 1 Jan 2024 00:00:00 +0000\n'
+        'Message-Id: <patch@example.com>\n'
+        '\n'
+        'Commit body here.\n'
+        '\n'
+        'Signed-off-by: Test Author <test@example.com>\n'
+        f'{body_trailers}'
+        '---\n'
+        f'{_make_diff(paths)}\n'
+    )
+    msg = email.message_from_string(raw, policy=email.policy.EmailPolicy(utf8=True))
+    return b4.LoreMessage(msg)
+
+
+BINDING = 'Documentation/devicetree/bindings/foo/vendor,foo.yaml'
+
+
+@pytest.mark.parametrize(
+    'paths, trailer_name, expected',
+    [
+        ([BINDING], 'Tested-by', True),
+        ([BINDING], 'tested-by', True),
+        (
+            [BINDING, 'Documentation/devicetree/bindings/bar/vendor,bar.yaml'],
+            'Tested-by',
+            True,
+        ),
+        ([BINDING], 'Reviewed-by', False),
+        ([BINDING], 'Acked-by', False),
+        # Other documentation is not bindings
+        (['Documentation/process/foo.rst'], 'Tested-by', False),
+        (['Documentation/devicetree/usage-model.rst'], 'Tested-by', False),
+        # Code next to the binding can be tested
+        ([BINDING, 'drivers/foo/foo.c'], 'Tested-by', False),
+        (['arch/arm64/boot/dts/vendor/board.dts'], 'Tested-by', False),
+        (['drivers/foo/foo.c'], 'Tested-by', False),
+        # No diff at all: nothing to judge by
+        ([], 'Tested-by', False),
+    ],
+)
+def test_is_untestable_trailer(
+    paths: List[str], trailer_name: str, expected: bool
+) -> None:
+    lmsg = _make_lmsg(paths)
+    ltr = b4.LoreTrailer(name=trailer_name, value='Tester <tester@example.com>')
+    assert lmsg.is_untestable_trailer(ltr) is expected
+
+
+@pytest.mark.parametrize(
+    'paths, kept',
+    [
+        ([BINDING], False),
+        ([BINDING, 'drivers/foo/foo.c'], True),
+    ],
+)
+def test_fix_trailers_drops_tested_by_on_bindings(
+    paths: List[str], kept: bool
+) -> None:
+    lmsg = _make_lmsg(paths)
+    tested = b4.LoreTrailer(name='Tested-by', value='Tester <tester@example.com>')
+    reviewed = b4.LoreTrailer(
+        name='Reviewed-by', value='Reviewer <reviewer@example.com>'
+    )
+    lmsg.followup_trailers = [tested, reviewed]
+    lmsg.fix_trailers()
+    _, _, trailers, _, _ = b4.LoreMessage.get_body_parts(lmsg.body)
+    assert reviewed in trailers
+    assert (tested in trailers) is kept
+
+
+def test_fix_trailers_keeps_tested_by_already_in_bindings_patch() -> None:
+    """Only new trailers are dropped; the patch's own ones stay."""
+    lmsg = _make_lmsg(
+        [BINDING], body_trailers='Tested-by: Tester <tester@example.com>\n'
+    )
+    lmsg.fix_trailers()
+    _, _, trailers, _, _ = b4.LoreMessage.get_body_parts(lmsg.body)
+    tested = b4.LoreTrailer(name='Tested-by', value='Tester <tester@example.com>')
+    assert tested in trailers
+
+
+def test_cover_tested_by_skips_bindings_patch() -> None:
+    """A blanket Tested-by on the cover letter is not applied to a
+    bindings-only patch, but still lands on the rest of the series."""
+
+    def _mkmsg(raw: str) -> email.message.EmailMessage:
+        return email.message_from_string(
+            raw, policy=email.policy.EmailPolicy(utf8=True)
+        )
+
+    hdr = 'From: Test Author <test@example.com>\nDate: Mon, 1 Jan 2024 00:00:00 +0000\n'
+    cover = _mkmsg(
+        hdr + 'Subject: [PATCH 0/2] Add foo\nMessage-Id: <cover@example.com>\n'
+        '\nThis adds foo.\n'
+    )
+    patches = []
+    for counter, (subject, path) in enumerate(
+        [('dt-bindings: add foo', BINDING), ('foo: add driver', 'drivers/foo/foo.c')],
+        start=1,
+    ):
+        patches.append(
+            _mkmsg(
+                hdr + f'Subject: [PATCH {counter}/2] {subject}\n'
+                f'Message-Id: <patch{counter}@example.com>\n'
+                'In-Reply-To: <cover@example.com>\n'
+                'References: <cover@example.com>\n'
+                '\n'
+                f'{subject}.\n'
+                '\n'
+                'Signed-off-by: Test Author <test@example.com>\n'
+                '---\n'
+                f'{_make_diff([path])}\n'
+            )
+        )
+    reply = _mkmsg(
+        'From: Tester <tester@example.com>\n'
+        'Date: Mon, 1 Jan 2024 01:00:00 +0000\n'
+        'Subject: Re: [PATCH 0/2] Add foo\n'
+        'Message-Id: <reply@example.com>\n'
+        'In-Reply-To: <cover@example.com>\n'
+        'References: <cover@example.com>\n'
+        '\n'
+        '> This adds foo.\n'
+        '\n'
+        'Tested-by: Tester <tester@example.com>\n'
+        'Reviewed-by: Tester <tester@example.com>\n'
+    )
+    lmbx = b4.LoreMailbox()
+    for msg in [cover, *patches, reply]:
+        lmbx.add_message(msg)
+    lser = lmbx.get_series()
+    assert lser is not None
+
+    am_msgs = lser.get_am_ready()
+    assert len(am_msgs) == 2
+    bodies = [b4.LoreMessage.get_payload(m)[0] for m in am_msgs]
+    assert 'Reviewed-by: Tester <tester@example.com>' in bodies[0]
+    assert 'Tested-by: Tester <tester@example.com>' not in bodies[0]
+    assert 'Reviewed-by: Tester <tester@example.com>' in bodies[1]
+    assert 'Tested-by: Tester <tester@example.com>' in bodies[1]
+
+
 class TestTakeFlow:
     """Simulate the 'take' flow using the actual code path: build email
     messages (as if fetched from lore), feed through LoreMailbox →
-- 
2.53.0

