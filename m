Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795534317;
	b=sa/KWNP7cIrCxlQEZbGWCSWkuRODguF9h0oQvO6u/5LMzaNSb5/7Kbe5IgzFa1h1/nNz
	 TTnQfvtaZM8qs1B8zQ/93fWQ1AV/r80Sm1YgkzwRsPTf5VUqrM0RzkG3GlpflV842mPfK
	 20pxVMItDjtDA3AbmnPKwzGO+ETx4xSXsWvWFx5b0MhiOTbCbnOOR/IUEMvdqXNo5S4N2
	 3mOJC/brfHctw3Z+AIfXPVOUUJB+mRZpJWmO4fyRc11ZyG644rotg2k6VWzLqqG7wd9fj
	 lRjplZ3KOeoz9pIL52IgzbKHvx7nZhG6Q72E9WrrP91B91/xEHNZcReW6FclJ2DnUVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795534317;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:DKIM-Signature:
	 Received:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nVROACRjiQA/gf9dE4qYsCfCRzfJ+yLZQs9zI23IrvE=;
	b=kqBrVSM3FmPzcFKZG1+oxEx53eCQsbzrKAXQ+XhbK0QMg5P6GZ0fqEY08P7SBCUUF7LS
	 as8YIrvjscep4UnCdiP0asunSnAXw5KqPtMiWAN+jKEMpULBVWXjHd/zJCZbDbEjwsIpd
	 5N4zkp8jcJhaZrzoFWGxzqB/0B9epSHLOjEQx0Tl7E/KzlwsQWb0tWkkzLQbhco7m3hzw
	 5lJQmXOMxxi6Xdzp6a80xm0k+ITx4+RTQkgzQ3TgTUBy55MPo+Az8DqYWIki7Xg3FYGqJ
	 /t+PqAAj/bOdMB26tQY3pPM3GrkV18ITWPKmEZ7vA5VlvI+Lv9Mg2x+n7NDwuv4IheA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AVVeiD1E;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ku2YpVGT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9732D606A31E
	for <tools@linux.kernel.org>; Tue, 24 Nov 2026 15:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AVVeiD1E;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ku2YpVGT
Received: by smtp.kernel.org (Postfix)
	id DBA2B1F000C4; Tue, 24 Nov 2026 15:31:56 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795534316;
	b=iOqvMNJeNObQkimWYqW68oYEvbrbLZUHtfvH2qcJVtJlxATePrnMohKs1YFQpK28JNmt
	 nv4AWmbnGYUeCE3+FyoRWPQCDU1k3VtFhYNKF4Z3LedtBQqcUVatdG+wXgBjlbDRlIUME
	 biqSbpWO37rPki7h9FBAVU7Uwg69ah17NZRYw0QFvQcmTtX/eM0/lA99HCm1PgtDtrFWd
	 Zn6TYwMA73RkIyKukiByDbIqc/nzpsfmtoorPTldjJ3OBYkKMFphr37TmEpJbN1lmCIu0
	 ukPBtj6tY12UJaOBKgBiEPyWGCXtJ0hrtp/F/YJnWiyEp8BCpTEVbB7qTN/Mmt359gQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795534316;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=nVROACRjiQA/gf9dE4qYsCfCRzfJ+yLZQs9zI23IrvE=;
	b=Y/k8fYtd99GVj5cAQ4r/hcWnSgf2W6WfsWe1fQTjqXrDiPRtW/lEXbe8cTYffJBX1yhv
	 AD3nOVUpPXFAn21DP0nnb8hW0Zphnx04jDujp6V+nIL9b6S/sJ5r93zBh8NjJ6F0avUXK
	 xtcgFZyA4/xjzzzKzd3WzdgKXPHYLSA46GqSm/RKGT6okB4hU9GZJvOi6CmcUMkUcigWh
	 CvMn4zAFDcD7ZBA4mvFEXEMp4VkR++sZBwS3/yRZsqEu32ks1rk0072xpXpsVgvkPZLo0
	 Y5g3i+D7tuIdJ9R8TDyVDEXxx8J/aYHVelLFHawHP/lYLG7xY1D6Y5J8FyBqbcXy7+w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AVVeiD1E;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ku2YpVGT;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 37FF01F000CA
	for <tools@kernel.org>; Tue, 24 Nov 2026 15:31:47 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AVVeiD1E;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ku2YpVGT
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 37FF01F000CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFKusG2569575
	for <tools@kernel.org>; Tue, 24 Nov 2026 15:31:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=nVROACRjiQA/gf9dE4qYsCfCRzfJ+yLZQs9
	zI23IrvE=; b=AVVeiD1EJ8WEeQRAxMJdjWn81ExGT2SOdfP72wzgC/vc07647Pm
	75TqbtLHLSIe/zMwOLbjS4QOhXJcapeWGqWLmDIgE7kWjNXBiTilwXR/F8qOb6UG
	ni6mZZe3eq2oXWX1aU52B0agE3UHrcPdor/55xU+77lcnrYV9xiSOREFPOIbfBfJ
	Gg3SDBSWdYD+kUE39W7nM284dy3sLSbx+K8peVMqQTajQX0Y1n96yf68rDuU1EtU
	7WDKxEWtlY1Zdk9cTbEXnUTpNre9T61VLvR2QorIPYI3r1afUvhggu2kEUA1etU2
	w/cO9DYSBc+Mr4ZhtzsVFgS0t8cGc++qMhQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4w6sv3v1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <tools@kernel.org>; Tue, 24 Nov 2026 15:31:46 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5ece3cd5a00so3071254e0c.3
        for <tools@kernel.org>; Tue, 24 Nov 2026 07:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795534304; x=1796139104; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nVROACRjiQA/gf9dE4qYsCfCRzfJ+yLZQs9zI23IrvE=;
        b=Ku2YpVGT+DVbzItFlbYpOl8t9nwaFxYZvC5sid14rfsb0ZSrOGRoZ7hxVhbo06AGvM
         sn2rB2YSKSPPElJc6U9mKeAAY8XOqqbQZsxWaF0ywYFn+AdvROSpWJna9j2SSX388zQ0
         EMWXN+uC5eIzUwE5FKoDWfT0/ie5IwbP2HYXme5/t2qQc459lfv8w2VPZP5air6E1+yp
         YO+vu6j/OcnzfHFWaF0snztM8z2uMbdYGol2WiX2imHXsf1Y/Xk3BklJ2nNVoDGFAqan
         ec42+0enek6oH0YqLt8Ji5UZFZcE0QPzkoAtIdhdfY2yKRZMiRKLSxeZdH7kAZvmwX32
         /wzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795534304; x=1796139104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nVROACRjiQA/gf9dE4qYsCfCRzfJ+yLZQs9zI23IrvE=;
        b=Vhw7ZhFiqP+fXHOE1BvfnHG7Zi8ZDRmWjSSLqBn8LaB4Skyy9NR3gSFDH3rZL06BTO
         HSWZEFlog0fpj968HNVsun/xxmIDtj61v2gX0VmwPCT7elCFRg3Pqem5yEqYqORn0G+H
         8oQ3GhisnxFNLWEfq18Y1AjQh4HcaMIUcRZP3mD/fQM2vbUEJ6B1CeJExz0WMxtNjmWG
         sKfiAabU0MPrxzOwHjTj6ZvHAQVcZXaVE+tr9qeVcVX1DsiaDQOtXdmiF4aAFM7qt/eS
         amuw7HFxcPPuBKg5rxugFdsxs16fWxyhQWpxUXM2DiORH/Iho76eFdDywclBwxBZRQMq
         WrTQ==
X-Gm-Message-State: APuU4Z/E9UAMXfganvJcgWa5VMb5Bu63Mv3oto+FCl8xvFnzJhjz8bpL
	kqXK/b2T/Y2tqTn9t8YThpvqcLaqxTrH8JAb1VuHH96rO89KxaHHBeMcDjtCnfbcgVLKupJTnfi
	QQ33IejuGKqqrMjOAXBnPnC8VtMGb2hJ6/MQ1zkmzFMApzRa+yy6EpHLUkYF+Cw==
X-Gm-Gg: AZFdTZe9LqRe1eMfdmZnjJkZM6xMS5UYPaYW18u3GY8/kwF5Ywe1+VDNpph/fN1G2kG
	WisbP8g0iGI6J1oHSfx+mrifNTVWYlUA1tvbQ/a5z7k0ZUh1J2FQpFN+qtW5T3YspDB1uM/Yezz
	n5vBK0iy3WYfjpJKLH9H4z4dlLy9IdDknEV9HnWqdU3cY+JYlBmIDpaNGMZSBjjWy13S1TqcB9x
	yzoQa81ndwBGxCVlTB5wi+GrV++jgl95J9TiXKnsxoAkFsXM6Pd68J8v7Zp3a6TZnMwurE1yYSd
	udgm4BE+iSw/c0K/saxFqPWH53NnXaxv4/eJEG0wl4bV7/EFpv1vw31Bu6fvjge/qfvbSZvYrCZ
	PYLVxWYdN/gQmGLk4iniFCzJhxRS7w1+o1PKAyWQ+OpsOi1fL3KMXOiOaImQFiCDEq0/w9k+Xw8
	jYazSpKD/8mMoDvksW4TYTLkdZBIaweTrpmw==
X-Received: by 2002:a05:6122:4690:b0:5ea:bda1:7689 with SMTP id 71dfb90a1353d-5ee8af0b00fmr9116983e0c.4.1795534303685;
        Tue, 24 Nov 2026 07:31:43 -0800 (PST)
X-Received: by 2002:a05:6122:4690:b0:5ea:bda1:7689 with SMTP id 71dfb90a1353d-5ee8af0b00fmr9116920e0c.4.1795534303044;
        Tue, 24 Nov 2026 07:31:43 -0800 (PST)
Received: from quoll.home (83.31.98.241.ipv4.supernova.orange.pl. [83.31.98.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884911e3sm531718135e9.6.2026.11.24.07.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 07:31:42 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: tools@kernel.org
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH b4] review: Allow custom Patchwork show states
Date: Tue, 24 Nov 2026 16:31:31 +0100
Message-ID: <20261124153131.100246-1-krzysztof.kozlowski@oss.qualcomm.com>
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
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9WUcBqBV9O3lyhFV1oyzl-s97scSRERa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2MCBTYWx0ZWRfX+g7PTYwt/B85
 gAXP66shApiBPgGvZpnwTJgJmZqoY8KpEJtR7e+pFitWu6oQPmc979pTTTURT4p4CsiVyyjg/wA
 ohBc2q/z4jy5XLOpsiXvFpCek0HSNzI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2MCBTYWx0ZWRfX2s0cluFOePBs
 beL5+BJftzIo5UujkEPU9Nc7iZtixB/OEhUJAHXs0eEeXZsJJYd4EO95JYZnYPfezGLHmh/Rq4F
 fCreJ9keAC2wSdlE/l7svPuI+W2EqBRYAqN803dmieIttRjjNkFM6DcA+LSwYT+IIc9zo1TUH06
 UAp9nk1mhFmg3i0luKiehD6i98ZyEcG26X1jC47PkVvg/9i8y1bBkVHCunhG5B2bwZL0KQx/+Im
 J/q7YGSkKsKDBFADgHqMlaGL633M8DzDioJisMy1qWZYScep2Nk+dMfcdyem+ULaB7GGaGKo6WX
 S3qjYIn2V2SACjhZ6Rc/DNYjt73nFwKPMRgKUSPwJsa2l1yEFeoXL9auxXC0ooK41JXpFocVeyg
 0jYiIGxgxgqYeIcdoRdzHZw4doI0naflTO1dXA9UzS6odsEKU0Nj6G1X5DX4um/Wc7hqyOWX7GN
 LMRzIKcgkXhvt/CxOfg==
X-Proofpoint-ORIG-GUID: 9WUcBqBV9O3lyhFV1oyzl-s97scSRERa
X-Authority-Analysis: v=2.4 cv=V8DoQuni c=1 sm=1 tr=0 ts=6b05ade2 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=ivW4MigAevuCEqTxTIunpQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=30NY_0GOi3EfWuvo08sA:9 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240060

Patchwork in some subsystems, like Linux Devicetree, uses 'needs-ack'
for patches waiting for review and typical state 'under-review' is
reserved for automation stage.  Add b4.pw-show-states config option
allowing to customize it:

  git config b4.pw-show-states 'needs-ack'

Cc: Rob Herring <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

This is heavily vibe-coded without proper supervision. I don't mind if
more competent person takes it over and redos with their authorship.
---
 docs/config.rst              | 16 +++++++++++++++
 docs/maintainer/review.rst   |  3 ++-
 src/b4/__init__.py           |  1 +
 src/b4/review/_review.py     | 25 +++++++++++++++++++++-
 src/b4/review_tui/_pw_app.py |  6 ++----
 src/tests/test_pw_fetch.py   | 40 ++++++++++++++++++++++++++++++++++++
 6 files changed, 85 insertions(+), 6 deletions(-)

diff --git a/docs/config.rst b/docs/config.rst
index d53ab9698c74..53cafefb8a44 100644
--- a/docs/config.rst
+++ b/docs/config.rst
@@ -1040,6 +1040,22 @@ integrate your b4 workflow with patchwork.
 
      Default: ``None``
 
+   :term:`b4.pw-show-states`
+     The Patchwork states of the patches the ``b4 review`` Patchwork
+     browser lists. Takes a comma- or space-separated list of state
+     slugs, and may be given more than once. Use this if your project
+     uses custom states for patches that still need attention. For
+     example::
+
+         pw-show-states = new, under-review, needs-review
+
+     Series whose state changes to one outside this list stay in the
+     listing until the next refresh, but are dimmed.
+
+     Default: ``new, under-review``
+
+     .. versionadded:: v0.17
+
    :term:`b4.pw-user`
      Your username on the patchwork server. When this is set and
      :term:`b4.pw-key` is not, b4 asks your git credential helpers for the
diff --git a/docs/maintainer/review.rst b/docs/maintainer/review.rst
index f4603ddb065a..e744ba1d5a79 100644
--- a/docs/maintainer/review.rst
+++ b/docs/maintainer/review.rst
@@ -823,7 +823,8 @@ If your project uses a Patchwork server (see :ref:`patchwork_settings`),
 press ``p`` in the tracking list to open the Patchwork browser. From
 there you can:
 
-* Browse series from your Patchwork project
+* Browse series from your Patchwork project (by default those in the
+  ``new`` or ``under-review`` state; see :term:`b4.pw-show-states`)
 * View a series thread (``Enter``)
 * View CI check details for a series (``c``)
 * Track a series directly from the Patchwork list (``t``)
diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 5e31566744c5..34682530cc7d 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -5045,6 +5045,7 @@ def _setup_main_config(
         'keyringsrc',
         'am-perpatch-check-cmd',
         'prep-perpatch-check-cmd',
+        'pw-show-states',
         'review-perpatch-check-cmd',
         'review-series-check-cmd',
         'review-target-branch',
diff --git a/src/b4/review/_review.py b/src/b4/review/_review.py
index e2499f8be155..a5b5c05bc231 100644
--- a/src/b4/review/_review.py
+++ b/src/b4/review/_review.py
@@ -4038,7 +4038,7 @@ def pw_fetch_series(
     patches_url = '/'.join((api_url, 'patches'))
     params: Dict[str, Any] = {
         'project': pwproj,
-        'state': ['new', 'under-review'],
+        'state': pw_show_states(),
         'order': '-date',
         'per_page': str(PW_PER_PAGE),
         'archived': 'false',
@@ -4247,6 +4247,29 @@ def pw_fetch_checks(
     return all_checks
 
 
+PW_DEFAULT_SHOW_STATES = ('new', 'under-review')
+
+
+def pw_show_states() -> List[str]:
+    """Return the Patchwork states the Patchwork browser lists.
+
+    Read from ``b4.pw-show-states``, which takes a comma- or space-separated
+    list of state slugs and may be given more than once.  Falls back to
+    :data:`PW_DEFAULT_SHOW_STATES` when unset or empty.
+    """
+    val = b4.get_main_config().get('pw-show-states')
+    if isinstance(val, str):
+        val = [val]
+    states: List[str] = []
+    if isinstance(val, list):
+        for entry in val:
+            for state in re.split(r'[\s,]+', str(entry)):
+                state = state.strip().lower()
+                if state and state not in states:
+                    states.append(state)
+    return states or list(PW_DEFAULT_SHOW_STATES)
+
+
 def pw_config_state(key: str) -> Optional[str]:
     """Return the Patchwork state named by config *key*, or None if unset.
 
diff --git a/src/b4/review_tui/_pw_app.py b/src/b4/review_tui/_pw_app.py
index 48c33ffd187b..050cfabf66f6 100644
--- a/src/b4/review_tui/_pw_app.py
+++ b/src/b4/review_tui/_pw_app.py
@@ -128,8 +128,6 @@ def _format_series_label(
 class PwSeriesItem(ListItem):
     """A single Patchwork series entry in the listing."""
 
-    ACTION_REQUIRED_STATES = ('new', 'under-review')
-
     def __init__(
         self,
         series: Dict[str, Any],
@@ -143,7 +141,7 @@ class PwSeriesItem(ListItem):
         self.show_delegate = show_delegate
         self.selected = selected
         state = series.get('state', 'new')
-        if state not in self.ACTION_REQUIRED_STATES:
+        if state not in b4.review.pw_show_states():
             self.add_class('--dimmed')
         if tracked:
             self.add_class('--tracked')
@@ -874,7 +872,7 @@ class PwApp(LoreNodeShutdownMixin, App[None]):
             if item is None:
                 continue
             item.selected = False
-            if new_state in PwSeriesItem.ACTION_REQUIRED_STATES:
+            if new_state in b4.review.pw_show_states():
                 item.remove_class('--dimmed')
             else:
                 item.add_class('--dimmed')
diff --git a/src/tests/test_pw_fetch.py b/src/tests/test_pw_fetch.py
index c634c4fad6fa..4374a121182b 100644
--- a/src/tests/test_pw_fetch.py
+++ b/src/tests/test_pw_fetch.py
@@ -17,6 +17,7 @@ from typing import Any, Dict, List, Optional, Tuple, cast
 import pytest
 
 import b4
+import b4.review
 from b4.review._review import (
     PW_BACKLOG_GATE,
     PW_WINDOW_DAYS,
@@ -221,3 +222,42 @@ class TestProgressCallback:
         calls = self._run(monkeypatch, sess)
         assert calls[0] == (0, 17)
         assert all(total == 17 for _fetched, total in calls)
+
+
+# ---------------------------------------------------------------------------
+# b4.pw-show-states
+# ---------------------------------------------------------------------------
+
+
+class TestShowStates:
+    @pytest.mark.parametrize(
+        'value,expected',
+        [
+            pytest.param(None, ['new', 'under-review'], id='default'),
+            pytest.param('', ['new', 'under-review'], id='empty-is-default'),
+            pytest.param('needs-review', ['needs-review'], id='single'),
+            pytest.param(
+                'new, Changes-Requested  needs-review',
+                ['new', 'changes-requested', 'needs-review'],
+                id='comma-and-space-separated',
+            ),
+            pytest.param(
+                ['new', 'needs-review,new'], ['new', 'needs-review'], id='multi-value'
+            ),
+        ],
+    )
+    def test_parse(self, value: Any, expected: List[str]) -> None:
+        if value is None:
+            b4.MAIN_CONFIG.pop('pw-show-states', None)
+        else:
+            b4.MAIN_CONFIG['pw-show-states'] = value
+        assert b4.review.pw_show_states() == expected
+
+    def test_fetch_requests_configured_states(
+        self, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        b4.MAIN_CONFIG['pw-show-states'] = ['new', 'needs-review']
+        sess, _result = _fetch_with_backlog(monkeypatch, count=2)
+        assert sess.requests
+        for params in sess.requests[:1] + sess.fetch_params[:1]:
+            assert params['state'] == ['new', 'needs-review']
-- 
2.53.0

