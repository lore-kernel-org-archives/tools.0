Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B276918784A
	for <tools@linux.kernel.org>; Tue,  8 Apr 2025 13:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744118327; cv=none; b=AfguKVN0iC283nQdp7S+onL2aeEWqbDunDhchXMudz9B5k7iW5a+yGlFggrqvaDH5X92HJfUVR/PrK7hdiiPppmv/jJUnqVHmKy95DqnChLUREteFtrOpAhAcRQnPgnHYsZYAMkX3kxjuMOmucJ4/JDmlL1TKIpRXhQ8dOrm0Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744118327; c=relaxed/simple;
	bh=CYK8ag14uy1n+XwXM+09zGvx6/LJTyLOJHhCNzGqUhk=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=dzT4CcYWaPwldgJqhUd9I8uztvS/MS2V4ubh1KXa5YksMFm0cmBUagBeTGifzllO6MDjQEYs5iLf5Ar9P4IWYhB2+ve6CBx+PsjXqRJxb+b0hDYNMMxIgZThO7qpAty4cHbtjPvAM7VwFgevIc5gKiSqL20Trr666kWEafrrW/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=BEje3iqK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="BEje3iqK"
Received: by smtp.kernel.org (Postfix)
	id 3110FC4CEE5; Tue,  8 Apr 2025 13:18:47 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 057F4C4CEEA
	for <tools@kernel.org>; Tue,  8 Apr 2025 13:18:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 057F4C4CEEA
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=cloud.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso60005475e9.3
        for <tools@kernel.org>; Tue, 08 Apr 2025 06:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744118324; x=1744723124; darn=kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CYK8ag14uy1n+XwXM+09zGvx6/LJTyLOJHhCNzGqUhk=;
        b=BEje3iqKkAVEaz139KKQKC+fYJwlKf3d+qHrrwm/Bq4LPL2uiW7SvToACvKpMPAXu3
         nTK6RoHlF4p6uqz3W0Hqv2i9p4HWpP4otk6hXHD5hTBYFJ80thGVM9wUec64+BQGqmHC
         PIHhVowCHVa4KEzEmjFbtGUUnGdnxy4a017Uk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744118324; x=1744723124;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CYK8ag14uy1n+XwXM+09zGvx6/LJTyLOJHhCNzGqUhk=;
        b=Dd/CI8seMJ+DV2526aHcO2UGVJTJMz7Pi87qBjMCQ/k8Kyby7d6JSodIc9CE7ls40V
         PpgP16tD77qix5jfkVaoVs81FD8oJILPJhsCuqSeY/OUK3YR6iSHTJSaz43DjEqBEygH
         sS9Quf61QlnUeHF4twaWcWb0K0EoXAfm42fEEVPNvr079dNWAJs3jek6h/Ju/vi4PtBh
         dXRt6hGVxmBa0zOpdlxnfzqfQR+/qkX5kX1P0t31tj4eu4+OndelABELydGpu+RPL60n
         bpuiZnIueYbteQy1a+dbKamTdID+WS/F5I5hvuTDofbHMnhvHUGiTWwUhHWXpQkU4t+t
         o/vA==
X-Gm-Message-State: AOJu0YyRMD2jaGC7gdg41dOHc8Qcl2emypvcyFowcf8IKYDmfCgtI228
	C93QE/G4d6A+UAY/0CAjJuudPhUxcuXepVnO2iWZXtusA2kSYVQP8kMHKfG/EZ7lKsYuSrFVmje
	nnzA=
X-Gm-Gg: ASbGncsnkGDFs0h8RgEFucjDOqIS/L84kuleS9HNmz1xr+YCXuO+TQcEDmKi0mn9d5c
	UTNEhdlFnTn7Bcx4NQm0na+1XBgiJokU24CTcthEO57uJSafxxQ52by3mZreCeBfPvBCPLOUnOF
	r3zjS837HDi2BY928uhbWcLtGCjl3D3s0q3Ns56pPkzBWTHEFK0fiVO0Gg/lW6gan/GwJ5+2OMK
	kXXCQTrKvkn/ntC2MQDMxvSefZ2xEh0lyifBNY+wgFCliYa8yeq0Y7U2wGvCzkZHOo/RrpQRvYM
	P2M3LBlJI3CICU6zu0FN8a3w4YGIaMGx2SwThbD7jHbKrDk2xWzuPt1KMlgBzxMoK5bX7b6EAf9
	6x95L899mpiGoSPocMs26
X-Google-Smtp-Source: AGHT+IGz6Q+cFzIVGDc3wIbpOi7QeZn2dKa04AhvmNQ4cwNMg21vE1oMz15ZCNrkoprIPKrjOUQliQ==
X-Received: by 2002:a05:600c:a016:b0:439:9b2a:1b2f with SMTP id 5b1f17b1804b1-43ee0613661mr160506265e9.3.1744118323965;
        Tue, 08 Apr 2025 06:18:43 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34a75fcsm158888885e9.11.2025.04.08.06.18.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 06:18:43 -0700 (PDT)
Message-ID: <b19f33bc-df96-4365-bef4-7f1393fc7ce3@citrix.com>
Date: Tue, 8 Apr 2025 14:18:42 +0100
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: tools@kernel.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: b4 inserts Reviewed-by tag from unrelated thread/patch
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

This is partly my fault for not double checking well enough, but it
turns out I've committed a false Reviewed-by tag.  (Anthony does
typically review patches of this nature, so I thought nothing of it when
b4 told me that he'd reviewed one of the patches.)

I've minimised a repro to:

b4 shazam
cover.7da1777882774486a13e6f39ff4a2096f6b7901e.1744028549.git-series.marmarek@invisiblethingslab.com
-P4

wherein the analysis somehow decides that "Re: [PATCH 07/12] libxl:
Allow stubdomain to control interupts of PCI device" is related, and has
inserted the R-by tag from that thread.

Unfortunately, I can't make much sense of what -d is telling me there. 
This is with b4 master.

~Andrew
