Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F03513FFB
	for <tools@linux.kernel.org>; Sat, 24 Feb 2024 04:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708747519; cv=none; b=sKZ6P1d/bjec6NrQ1MOkcPii8umjUUg5QI4ea7YRMzLsPWA95nOSdR+DgPOr4XKjDKLIEXDxbSn9uLJNtbWVYJshf/UyDTvyqBhOFg9iMWtn/2f6yWVRaP4fsAhzOLd3WFMeCqhq5lDwxpMoJmGIu9/AlKkP5Fls/n59VvQlB58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708747519; c=relaxed/simple;
	bh=syMPNSdS0bXxMdzOI0oXerlzazA12/Gd8MS0MxH5Tcg=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=Z8X/eFLfzGyHzbi/PXWIzKyxBL/8sTaGBm5SlK9zwZEQTRQFWCX3PRbeGPn25acjaLPoA5NAABWqgpm0Zad8+lZ/zH2DwaVrpRrgva73d3igyNgDOuJ890NRLvHcOnzHOOoLEKfvXHUyQw42JpEH5fFOXhsleDB6biaFphJ4/qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=X0PcWowq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="X0PcWowq"
Received: by smtp.kernel.org (Postfix)
	id E8A71C433F1; Sat, 24 Feb 2024 04:05:18 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D17DFC433C7
	for <tools@kernel.org>; Sat, 24 Feb 2024 04:05:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D17DFC433C7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=cloud.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2d21a68dd3bso19365651fa.1
        for <tools@kernel.org>; Fri, 23 Feb 2024 20:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708747515; x=1709352315; darn=kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:content-language
         :to:user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=syMPNSdS0bXxMdzOI0oXerlzazA12/Gd8MS0MxH5Tcg=;
        b=X0PcWowq1/m7ybuBl0dtuU4Yz+XKhtBc6yprNwbAte3IAkz5w655rDgAfxCAvQSsXx
         c8tdu2hD0edKOo7srPjcNvY1jF+g9ZBMXQ2PnHiO9PlLrgC4yfVdm19Ds3f6Wl8t+zAE
         WwdwtWF84PTJfr+xmKjKoRBJlnMm6ltCcxXmE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708747515; x=1709352315;
        h=content-transfer-encoding:autocrypt:subject:from:content-language
         :to:user-agent:mime-version:date:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=syMPNSdS0bXxMdzOI0oXerlzazA12/Gd8MS0MxH5Tcg=;
        b=WrEVESbGsLU63FhWZOAgHF3wlwlFO5uumx3nEEsyhS37F74AgEiwQJ74Z/VaaIxeQY
         pXxV5BYYAAjdCTqdm3zH/6XH8yUdrIFcFWjAFP0ZRRv97bP//M2C0qRuhmJGJ3yVl5lK
         nSj2Ikgl5pgPkYyqbpQsyOi2T6vvRm7WyMcz+1LcoxHznzf6CQ2PCxPoEsB25n1JEwDd
         EWKira7ADmgUP9rOOkE88/UiIcG5D40G8AC6E63hzMPctiVFB1yfFwpgPs98Fh1KhL3F
         YKGgI2OdQRn+d3bj5ZLke1QgBYMuDd6C9AuZxdK4jTQgmy1xtBDQGkcqeUiZIa/0BpZT
         kdYQ==
X-Gm-Message-State: AOJu0YyIlIYUm3QYC/sCLr+RiseTzr5uthLmlCPZkTpJGp85I07ExydQ
	ilGeDmEIfYR0NRG2QSqZMiTSuDU1+rsHBgoCGkj9+9YP2GwbJ68x7Fh+nk0pW2p/ATGS4dLKy4G
	t
X-Google-Smtp-Source: AGHT+IGdTzHPOKpa0u1f0SGvxu7m5FY27T7Aab5+mflFh5J6nH7z5fGuJwpm2zBhNdQQ+s6KnvrCdA==
X-Received: by 2002:a2e:9d05:0:b0:2d2:3b0a:d404 with SMTP id t5-20020a2e9d05000000b002d23b0ad404mr491477lji.44.1708747514809;
        Fri, 23 Feb 2024 20:05:14 -0800 (PST)
Received: from [192.168.1.10] (host-92-3-248-192.as13285.net. [92.3.248.192])
        by smtp.gmail.com with ESMTPSA id vz2-20020a05620a494200b00787af8b5c02sm194459qkn.39.2024.02.23.20.05.13
        for <tools@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Feb 2024 20:05:14 -0800 (PST)
Message-ID: <0137232a-5380-4869-9a9f-8a8db3506782@citrix.com>
Date: Sat, 24 Feb 2024 04:05:13 +0000
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: tools@kernel.org
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: b4 failure to apply patch with ANSI escape sequences
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello,

I'm using b4 0.12.4 from checkout, and am trying to apply
https://lore.kernel.org/xen-devel/20240220140733.40980-1-anthony.perard@citrix.com/T/#u

The git am fails, and to my surprise --show-current-patch=diff gave me
hunk 3 back with txt_{info,err}= having a coloured closing quote on an
otherwise uncoloured diff.

patch complains of the mbx being corrupt, and it looks like something
interpreted the string into a real ESC before handing it to `git am`.

Thanks,

~Andrew
