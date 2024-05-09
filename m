Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF3C161
	for <tools@linux.kernel.org>; Thu,  9 May 2024 00:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715213145; cv=none; b=Jok7opcimwGKvek6BXsSxHzqsGPOy3heiiAWQswDn2eX+i9dC9zv3elzkGIJ69Ec5bVpIUaf46QyMUwrkSm5qSZq32geKvVC4TmuEb+N/DLrziVridQdCHl58vkivMxa+E7Z0OPmC/xqMOFStc7yIkAdr9kF4C1savuffgYSF50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715213145; c=relaxed/simple;
	bh=4v1f+/c6YtCkZsXJLXdAg9h+FKmtYXixBTULM5N18Mc=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=qkO4HDvSpQ/22jJcLzk/+VbhKHUuwAyJkjF6z8lnVIfSI2Jqul7FLoBAa3Od5DDy5C7jK22dNmT5t2hGzJnskV/rkWL5V9QnliBABVCgYxtQsgoD4p1T5OZIPcpSDMtjmLYeNCOOwgDsU8ZfxmHrV0PBnI9Pli/skcjul2Mz4X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=cZBp9Odc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="cZBp9Odc"
Received: by smtp.kernel.org (Postfix)
	id E47B7C2BD11; Thu,  9 May 2024 00:05:44 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 18BB9C113CC
	for <tools@kernel.org>; Thu,  9 May 2024 00:05:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 18BB9C113CC
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=cloud.com
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-792bc48f6beso14750585a.2
        for <tools@kernel.org>; Wed, 08 May 2024 17:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715213142; x=1715817942; darn=kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4v1f+/c6YtCkZsXJLXdAg9h+FKmtYXixBTULM5N18Mc=;
        b=cZBp9OdcrtxoiSWR0aIqT8NfyKdsEqCgxpp6AMobjsUDUpiE9kCfjOEsoucppGULZl
         l3eUy/yIOtWvevD1Mu3lX6fr6TBN+z1EWRzy2XA5/ZOjRsb9VOmwaxFqJsvcNQrwxZW9
         VtifAJFtO8sH76sKG20GUeK9QZXOaXPBpoY64=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715213142; x=1715817942;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4v1f+/c6YtCkZsXJLXdAg9h+FKmtYXixBTULM5N18Mc=;
        b=sVLcgwzbnNm1FP7g+jCQikrLsK5BN85ReCOlgXy8aIlHPQCmN84XwQRXspLW4B9Nv8
         vSqZyGK/RpA0QQyyG6vT4chZnRXTis6puk6hCOIzJVq6EVJvRVq9LGsbNfWkQGvLv9Re
         VVkUWhKmrRMLsbkuaBLVTMWQL908oaLXTxSQ4D9W1WMzAjKYGGXQfq1skI6kVjQwpPjG
         +bWXcXVLehNmjnLyvKJ1erNCRxv1+X7htxj/v4j85+HbgdFEQwGAPC4HIiQWyH4fe1CD
         4IGg6H2t1nIWLIPG7eN6zvMr41bGBtGTMRlChNzCqibj4wOw1XPa8NnP/6qx/ehykotv
         AqoA==
X-Gm-Message-State: AOJu0YweA/7ATVqq6QqYu6j2dI/FPb0Bue4xdsupBANJUyJO/KKrWXeb
	6z5yq7+xgol8eEm2u/qbWVjg1xZZOUeo/okTmxaMX3OnyRsxvKXtKepysvvDtB0s/A/TzJazMZ4
	s
X-Google-Smtp-Source: AGHT+IHhI07DhN3AXf8QqF+SdLejYbIWuxQKxxdOyyfbWyPM1ecfU6IEsakS2p065FfFvNqNMI3whQ==
X-Received: by 2002:a05:620a:46a2:b0:790:eedf:42a5 with SMTP id af79cd13be357-792b2829119mr602029285a.47.1715213142390;
        Wed, 08 May 2024 17:05:42 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-792bf27fdf8sm6189685a.44.2024.05.08.17.05.41
        for <tools@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 May 2024 17:05:41 -0700 (PDT)
Message-ID: <2510008e-23d5-4c15-a16c-be9de549a425@citrix.com>
Date: Thu, 9 May 2024 01:05:40 +0100
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: tools@kernel.org
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: b4 shazam not stripping ---
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

b4 shazam 33b93fdf-bf16-49b8-aec2-0b2c19f5c471@suse.com

is leaving the notes under --- in the commit message of the finalised patch.

I cant spot anything obvious that should cause it to be mis-recognised,
although it isn't a git-written diff.  Reproduces with 0.13.y and master.

~Andrew
