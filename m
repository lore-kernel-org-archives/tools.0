Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E47A1DE3BA
	for <tools@linux.kernel.org>; Thu, 27 Feb 2025 19:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740682802; cv=none; b=A5vLHv3NMhsWIvf0At5uetx6VTsTvi2qzEe070958DX3Sa2B8ErJVe4P1MqPlip5f9LqLaRcTAp6O1XXeGGbzlo/c0y06Iku0AygTAZRZJQNXCGJhhv7WMowLXoEOoG/KPDLuoyvAahHD9ElIP+bB8Sq2Ee+6WjcCV6wwkyBjgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740682802; c=relaxed/simple;
	bh=bi2vq51DSAY+xte7HSbfB4I1NDObQs+vTv9/bdb4hKc=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type; b=XsrVqj5RKrd8VI+tbTsqMK19S3aIuzpzSM0YQmzGTCBdm6r0xiuPK0voHmTjzXP7gmqK/7FM5dLmPDVu4LYykSx5JHDeW3BvxiP9knIaO2dnDAYumjt+MxP6bdeyPCVJvCRLJt6P7QVmSZozpd7YrbLi73TcXVEwnOa0xVWcaPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lzX6cp4U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lzX6cp4U"
Received: by smtp.kernel.org (Postfix)
	id 9B511C4CEE4; Thu, 27 Feb 2025 19:00:01 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A5DA5C4CEDD
	for <tools@kernel.org>; Thu, 27 Feb 2025 19:00:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A5DA5C4CEDD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51RGa6Jc000821
	for <tools@kernel.org>; Thu, 27 Feb 2025 18:59:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bi2vq51DSAY+xte7HSbfB4
	I1NDObQs+vTv9/bdb4hKc=; b=lzX6cp4U/AsfS1YHFb6fvQvMKRgu65WOfYI0i3
	sohSZE8UhbUeoBOssag8lVR+GtcpKoWruFN/huW1CIR80N8eO+dlJZcSbvMHvvbv
	newD9h9UAhjkCqsBZpSO4LtiKrpDSDpNtuNaVJuWVWhC4m0dhp/BqEzeS3U5DRjO
	wygQ1vSYad4rTUoOUAob625bJuzDhiip26PRqYuCY9Q15+vJKN7O+FkfdlE6Cqw2
	5YB+WTYQVogQ/eotSQFkCzM6VuyEejd9SqCfUlRfVc84XfNvftDRoCRbh5HU1pGu
	eHE6jTE98feoS5ded5YRLrT0QBGGyBE9NRnW/5GOm94K0xgA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451pu9euqa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <tools@kernel.org>; Thu, 27 Feb 2025 18:59:59 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-220ee2e7746so23886655ad.2
        for <tools@kernel.org>; Thu, 27 Feb 2025 10:59:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740682798; x=1741287598;
        h=content-transfer-encoding:subject:to:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bi2vq51DSAY+xte7HSbfB4I1NDObQs+vTv9/bdb4hKc=;
        b=G5htowDhTnoWtUxYl5NWAZalFKeX8mv2SZXje4U3/ul1Tu6NEK3pzaUi1OpCrS4zFm
         7CwgHslloh8wSBBa3gV3PCzip0ZOC85d8DpbxfQIkDiRJymmyeYpDQWEdU6uj6Z2TIxG
         YwlTI4qVqQvgFx7MCNvHjbTG93w2k0sVTMawM9kxNIUMAXOJQlYwSiurNfpjHfH/Qn3b
         zNlZ9HO6WLgERSA9EeXhhTLxLKezCvTnKOYYo/nYcDQ21ysxSbU0NFI9ajlm6mRVsVMB
         MYx4T9NrWNHfpfckmDqzhJ6RJRTr3ygPnod0OQ61GsxYINFIMrZceWze+xv+6F1UjZK+
         n1TA==
X-Gm-Message-State: AOJu0YyBKBW5R33rsFZiV5jAvMCXXg8HfbJpCtM6p3jNdCB3Vc2eqIYj
	Qd9wIve03dzR+xVfsdU3HY4qrhuMIujbzAHJ+uMsXGjD9M/VUVDlvJBgQaCdn4PqrnFEt80ZS1H
	Tkinnb3mSwGAnZfgjescOLhfh5+uaz1pN+9XVogLDZxpKMMKJIdKSFJk=
X-Gm-Gg: ASbGnctUJM63nwugslbKo7+++Tp7/ioRIdbvbUem3/nXXFwj+Gav/5rpoRXtUQz9MLI
	ohSIwuGuglypj2xU5KLyKwoSYQMGrH+hX7LeW1JXq0bwHTsA3bO7WIjC8JDIxZc3GEsz+rToX9e
	qTW4KtdtOKL41egK8ed6YU8wC0NLlDAceg22TPa0+jkNk7yp4fdTBgUoPJL6smaRbzmaupUbGsd
	zzTLZKQCPJIEnRKU5Us280n58iiT4NPCPM7IAg9wITlekKfv4Hb3vuLtrRDSLg7N9dhA3eHM1+e
	bJniFIsjKTl+VNgpKTObweprp1v7B14C3Fuwyg6Y/5mnC+57gQw0MXV1H79ORvcFR4UpD3Skebu
	78VIglQQk
X-Received: by 2002:a17:902:d48c:b0:223:53f2:df14 with SMTP id d9443c01a7336-2236925c5a2mr3557135ad.43.1740682798534;
        Thu, 27 Feb 2025 10:59:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjQGeQecUaK1i8xGnbuU62Fgb+VT3wQR3cXbin+LneWU1we6MvU8oasaoYtJ8g5h+T/N0fuQ==
X-Received: by 2002:a17:902:d48c:b0:223:53f2:df14 with SMTP id d9443c01a7336-2236925c5a2mr3556775ad.43.1740682798121;
        Thu, 27 Feb 2025 10:59:58 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501d2786sm18805445ad.6.2025.02.27.10.59.57
        for <tools@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 10:59:57 -0800 (PST)
Message-ID: <03d82eb3-c1c1-40c9-8508-b8db63f4bf12@oss.qualcomm.com>
Date: Thu, 27 Feb 2025 10:59:56 -0800
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: tools@kernel.org
Subject: REQ: patchwork adopt b4 behavior for cover letter tags
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: TFhRnyGsynKh3G77KE2WdvTdvVzNm_aX
X-Proofpoint-ORIG-GUID: TFhRnyGsynKh3G77KE2WdvTdvVzNm_aX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_07,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=614 malwarescore=0 suspectscore=0 clxscore=1011
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502270140

Currently when someone replies to a cover letter with a valid tag
(Reviewed-by:, Acked-by:, etc.), 'b4 am' will apply the tag to all patches in
the series. That is awesome.

However, patchwork doesn't do the same. That means when I look at my to-do
list, I can't see that someone has given a R-B or A-B for the series.

Is there a way to update patchwork to have the same behavior as b4?

/jeff
