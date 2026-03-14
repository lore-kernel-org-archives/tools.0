Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240D056472
	for <tools@linux.kernel.org>; Sat, 14 Mar 2026 00:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773448975; cv=none; b=LaVNTF7qEBhI/i+xs16chE/oJEpbpgVU3eWNl1QkmP/H1Tlz2UWh/d0ed/4G/P3i6qY8Vf0s7QZ89u4E/vQR65jDYOmCTQ2txPZa66qHjZJo7ycfIdFZRgkEqM+hsrWIJHWhekuNYM6my8wJZFeYI20LARgZOeeEKDHw07Y5O3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773448975; c=relaxed/simple;
	bh=SqNV1ERy5HS8LcusM8EbPxjmho7XJSnoCzc4QwE6gS8=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type; b=KwjattircJFjsv97GgZDSwS38sp5vrw+y4bfofbxuhpWw72YExxioTJ28qRHlgn22ukVwuLWgQPozlujMBqxa/Y7rwLYLi75YZeeeDxaNuSHYNCZb5JQMCzRgUGTLzpjVmGt9Pq1P/fVT9Hta4yTsqKYd8XOfm43vyU44Kxj2Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Br/oQizD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aJB12Z2i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Br/oQizD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aJB12Z2i"
Received: by smtp.kernel.org (Postfix)
	id E34DAC19425; Sat, 14 Mar 2026 00:42:54 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F2357C19421
	for <tools@kernel.org>; Sat, 14 Mar 2026 00:42:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F2357C19421
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DHl9HN1749131
	for <tools@kernel.org>; Sat, 14 Mar 2026 00:42:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SqNV1ERy5HS8LcusM8EbPx
	jmho7XJSnoCzc4QwE6gS8=; b=Br/oQizDeDF/OcHIZ/GKbNYZNZ6shhlyrolEe1
	y3StTmJ4ijL4+wfBxOFLz6p4Abf73Pbo1WCqnG91v1srItQwYdu0kp6eNVIbjcN8
	6btzpzIqJvr4Mz6pPJoFPLvolcqmbfWfQQokP9BJLn7Hxi1B8tDPFhNcHG1peQxt
	H5iIcIVEz7yp+iNbbn3HzaebUocaqWyBwr7SbM4+Q/9yFpaEj8bhFQSs/o/JTqOO
	aq283JKA32cc25VpJS7uMpwhSnupNRscIbqPTqKUXN9OWSE/MayhD6htk0QNsW7l
	R3E0Hfa6C9WUsCZioMC/XRmxTPBxSu1+F01cFQqtOxzINRTw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvgj6jjb4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <tools@kernel.org>; Sat, 14 Mar 2026 00:42:52 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bdf75bc88fso3146522eec.0
        for <tools@kernel.org>; Fri, 13 Mar 2026 17:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773448972; x=1774053772; darn=kernel.org;
        h=content-transfer-encoding:subject:to:content-language:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SqNV1ERy5HS8LcusM8EbPxjmho7XJSnoCzc4QwE6gS8=;
        b=aJB12Z2ibb04PSZxgc5zsXL3bNqeJs1Pz6le8CuY6olA/iTOmo+g4+srhq7/pcru0p
         m22nLg54SfVasUJSK/euWmU+bwGZCTRqmFH0LN0ZC/Ia2bkc+gZMrChWTIoz53yw3IYY
         hjjuxZpxbIKhL6i8vwzDCWxkPFGBCgc5Z5mrdgXAqMRDcwhC+8N7ysCTy0p38tgrQEuZ
         hWT3Aqb/ElEKzct3BVcc8XDPN2mJVQI0OOBJ8y46ePrLzET2YeJPlllvQXpiJ9chnwD+
         gNWD+QmwioD7LSn3Cii2L3IEiWZ3XCM3jduixZGnyyVLY5KEdE4H/t1A/2o46KGXbe0I
         kCYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773448972; x=1774053772;
        h=content-transfer-encoding:subject:to:content-language:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SqNV1ERy5HS8LcusM8EbPxjmho7XJSnoCzc4QwE6gS8=;
        b=e5rseEl1JGYWX0dLjpNeLqY3IL5kJ/6gg04CP+Kd51wSZKDUQnAbndda+w2d0geq8a
         EZhtqD8ypaDHvyi+lvqeKetkD2ZwNi1k1sPpQmOjsOR2ECBMPFxhkpZcTlPhdBFMyDzk
         AjV8lc7QiY4Oh39RW8woTrRvxB9lb+0iifxqHG2AmHKJ0JFC7qzIUWTNr6K5Elwu3NuQ
         c2aYBRhcPb2F5K9Qqxv3LS7GSRpU7hGciz04BmJEGgTvDZ9GpN++RYewMAP5AiHjKZJK
         VhJEeQeOt7G/CnMyo681eV+EwMUs0O2+LzRLV3si/F6rr608Nik3jXLQwJsPEqXv/Bn7
         ckSQ==
X-Gm-Message-State: AOJu0YzTFJGT6hOF85PPajy5crhU7wJu3m4IWsq+qTHQ4tH/ulcX+3JN
	f+AntBdjUxAXpB5xZSzi5jpjfXjG4kD5NAZQE/641VMQsmsb2knTfyJFMjbV62I0K390X7XFFqI
	D/0phk7ysqCOgSC7a4cByV1Bn2dU0z0NQ7N0PN0stty/yK8dVKGEgGxnyDMI=
X-Gm-Gg: ATEYQzykOUrpvvumhbvo4jOCAaA91tfDYWx+TFUqaVOr9FwYaTPdHaRZLILkYOqfey/
	BqL1OTLFxiyNDcstb3xI5EFvTtPV4w77SZ2bNrkQy3gqy6l7wV4OyfXoS5k3H6KAlnU8CbnbA0P
	hXEqNYO0OFTl9hudXX6RXT2fYuoD9l5WUaFsO/ZNIcWX1JnPt13qhByBg+Gs4XW/BUz0NVmbo+R
	IGuLmLU1QvYy0bsycSsFGOW+nwcQE8K6BGfw4B2tEtOcHupzwMRVh2oyFiyoDlR9ykuk/M+88Cf
	LOeeS1a77w8Sfx053gyJxTnR5U3N58XRIvLAAjLcx1QQWldJEPz0U70QRA44QlnbbB/M3NL6ueW
	EArXmCII4tDDb/mVGovMGyquqXFF+o898b1uby1vGlS9jg7TzuA03h70KW/+6n1QT7WkG+H4TxU
	wRUJcnM7CLIXFt6w==
X-Received: by 2002:a05:7300:a287:b0:2be:8216:57cb with SMTP id 5a478bee46e88-2bea55e9f0dmr2245261eec.29.1773448971951;
        Fri, 13 Mar 2026 17:42:51 -0700 (PDT)
X-Received: by 2002:a05:7300:a287:b0:2be:8216:57cb with SMTP id 5a478bee46e88-2bea55e9f0dmr2245250eec.29.1773448971390;
        Fri, 13 Mar 2026 17:42:51 -0700 (PDT)
Received: from [192.168.1.41] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab527170sm4727184eec.21.2026.03.13.17.42.50
        for <tools@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 17:42:51 -0700 (PDT)
Message-ID: <580f6d1d-777d-460e-bb02-12092965936b@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 17:42:50 -0700
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
To: tools@kernel.org
Subject: korgalore installation errata
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE0MDAwMyBTYWx0ZWRfX/psbWpIL8PIH
 hlk67PjFCg5Uog8ZeaGJiQoIAZdCNhFMaUUDf2zOv7JAcGTRfxNFwDHiApojg6Uvc5C8bC7hj6A
 IF051Ggdu3fd0WgTgn+j1ZUcXvrRbDTVzV/LaE0N4w5Zy8s4qACpFNMLddtCYUuagAs4Kn3tZzb
 /07TVnMGs4b1Alr5lDgODng78kSMp+6NN3Fs9yCAKagt+LyBHZBPIYuri0/rJ83vKFeeR6VJN7v
 4/quSuh+H5h327MK5AcYejR2AHgn4AY8tZzlBwsvG9SBCdTk3eeqbttoNOkZD3HvqKPcP/shr0/
 G2kiH6vBMCgyYBKscoUHwXuKCZp7Qo8uw6Ira0ehUeV4Yz1CId32Zkp+FvJgH0JcwxBwhD/BuBk
 tutDjDgU7PgmyBPCp16il4cMDDxiQ9GZz556Zoai+epcPHIJDyVZtDuevO1A/fCTTrTcdXc9zTN
 NJQiKwaLa44If3iJe9g==
X-Proofpoint-GUID: bKf6N0NUyb1iNVxmUTuPWtQnloRIGbdz
X-Proofpoint-ORIG-GUID: bKf6N0NUyb1iNVxmUTuPWtQnloRIGbdz
X-Authority-Analysis: v=2.4 cv=H+vWAuYi c=1 sm=1 tr=0 ts=69b4af0c cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=DCepHnGjsyo4cTgMvm0A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_05,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1011 malwarescore=0
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603140003

I'm trying out korgalore using the guidance at
https://korgalore.docs.kernel.org/en/latest/quickstart.html

In step 2 I used the shortcut to get credentials:
ssh git@gitolite.kernel.org get-kgl-creds

The output guided me:
Put the following into ~/.config/korgalore/lf-credentials.json

But the manual instructions that follow, including the guidance on creating
the configuration file, specify a slightly different filename,
~/.config/korgalore/credentials.json

Is there anything specific about the filename lf-credentials.json?
Should I use that filename in my configuration file?
Or is it ok to rename it to credentials.json

/jeff
