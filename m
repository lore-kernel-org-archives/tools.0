Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240B924EAB6
	for <tools@linux.kernel.org>; Wed,  5 Mar 2025 14:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741186287; cv=none; b=nT79P1sbabn9KmB3Q8u3mfDwR1ojqjau+8g9exgihszXSfod1NTpck2lQHvAJHUZDKYd6WDXruP4z7uRb1ZdP2NpuUtwBXoiIs2hxX/htKnGrPv1oPGVg8S0CJ4u/0p47e8SoEpbfrOiANBHgj7VJOfYfGcsmQaiRYNkNUxzgZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741186287; c=relaxed/simple;
	bh=qFKMIT0pN7Ui+EKX4WIVbKeHsBCqgAfwAqVO15ZVq4Q=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CH3sE8ArX5Gv9SBNsgMZM0+gd3eb/j+dwBTnhc6LyTSiYYryMQBmtOQZVfEQHnp7wAKWNOT8Nf1MaOrd9Ag6IEovhdU07/w0KBvwYDurtOyd7J7Cy+lI+7MKgeLIWWneFD28Jgq8EbFc/Iu/R7bSK2q8YLY20uLV6F18Pi1/7+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=eDFYEiSj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="eDFYEiSj"
Received: by smtp.kernel.org (Postfix)
	id A85FAC4CED1; Wed,  5 Mar 2025 14:51:26 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BBF32C4CEE0
	for <tools@kernel.org>; Wed,  5 Mar 2025 14:51:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BBF32C4CEE0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6f666c94285so62518147b3.3
        for <tools@kernel.org>; Wed, 05 Mar 2025 06:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1741186284; x=1741791084; darn=kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0a/iEGkyIbeFqkdsKgL+346QTtXk5bDFsIaRYygUdi8=;
        b=eDFYEiSjsGXJqtNvQ8xqWFDlKwjsJQp/cbNyxaojo6V2Ph/B0XndU0cFGXMCCwcUeG
         qns0bBwyUlJck5xMl0DBuP+JbGQSJlmDLa4cpz8iMMNOJ4msdzkxidPbQq3WKLTviWz1
         JaBVrctCRi+hoWTzzldpywZAwTa6wE/0c4ykM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741186284; x=1741791084;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0a/iEGkyIbeFqkdsKgL+346QTtXk5bDFsIaRYygUdi8=;
        b=PFi2PQNPH7N+JBsEEckEFFBbIcVl3Vk98hVfZxhIVo6mNbAVGp//kQsCANWk9d4e7c
         sVcEus+ss/P109NITqtHyyRaBP8Z9YrV4K8fRsySkG68gfeAAHUZoO2GVIJO1Y+a1IQg
         MREQ41M84++WtTUCxdYo8YVxsk1aJ1cB8NGwi6e757SRDNW7UuC6PUEqp3jI5WRDG/ZW
         Y+kPyQ2UBe/nLP4usnmS6KWiKXPjqjiXUJtQJK+3uKmJXYohpR6wZXPqZTadL1bJvaTn
         HgQYlinFnVY62rv9jtoo1ZtjxCv4ie5fjeee6EDo5LGavM5fRxMse3v/Bv82AmQoXAqu
         5cLw==
X-Gm-Message-State: AOJu0YzABA3F1e6xia0ZC4pl9VzCXacPlUc70uBRue/UX4Nrw1RxBH86
	Qp7+R0uMoyulnLwaZfZ45QNEYV+WD1IOhtJ1CBcxDDfpEgkNA0F+wqHsDGYEl8am2F0aVjbbg1H
	YHDk=
X-Gm-Gg: ASbGncvSVF/BZ8/uS5z2LdgMHZy6yokhn66B6GdJKq+/Zsg2Gojy8tHKjxaxFcIhqC0
	0bJXc6e7Vq+FCm5sJbWb8nISIlB0D30cRE1PtxmyCmNntyh/OeEBMP60d7ohMCv35oQ7unSdxd6
	riE6k1bVvwD2anrmmdD2lrjpFBPptE/2GFbVhtrrlfeip4gayIvFlTo2729MKK8Zm0GbTamUu12
	cCjTCP+JoX4FbtBIAWoejp6vbfBZkF7DBGjuPNnerninT6JalzdTeLX/Iq6bSvCZdXgVCGu5ZG/
	IH5RBqYfP5lz/q1uFC9SJ/1pAhajUEfMmytqj0w7tzt8sQ==
X-Google-Smtp-Source: AGHT+IHl1p7crES9rdBe/3GgHLZXdy6ae04kGySoFzZ76Wv4wtjJNfadDLERzYqej7NA+hwWP2uKOQ==
X-Received: by 2002:a05:690c:48c2:b0:6ef:993a:29b4 with SMTP id 00721157ae682-6fda2dce8b1mr51324157b3.0.1741186284617;
        Wed, 05 Mar 2025 06:51:24 -0800 (PST)
Received: from bill-the-cat ([187.192.142.234])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6fd3ca633d6sm29337767b3.54.2025.03.05.06.51.23
        for <tools@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 06:51:24 -0800 (PST)
Date: Wed, 5 Mar 2025 08:51:21 -0600
From: Tom Rini <trini@konsulko.com>
To: tools@kernel.org
Subject: b4 feature request
Message-ID: <20250305145121.GM2640854@bill-the-cat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Clacks-Overhead: GNU Terry Pratchett

Hey,

So I used "b4 shazam -P 1-2" to apply part of a series, and then "b4 ty"
to thank for it, and then the contributor asked if there was some way to
note what parts were applied. Could something like that be added?
Thanks!

Link: https://lore.kernel.org/u-boot/20250221203243.672465-1-sjg@chromium.org/T/#mf9bf52e665a76f86f4afa0dd77e6a278da195f16

-- 
Tom
