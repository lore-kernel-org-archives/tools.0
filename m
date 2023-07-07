Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9881923C5
	for <tools@linux.kernel.org>; Fri,  7 Jul 2023 16:36:49 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-76714caf466so186350085a.1
        for <tools@linux.kernel.org>; Fri, 07 Jul 2023 09:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1688747809; x=1691339809;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JpC3g1AOkQLljsiPGkkcru7NhLVHI1qY2XmUAG/gcsY=;
        b=X4P7z6f5r3tt/9db+40J58fAqyyCoXXZ2OX+/6bKCWLKmZp2PJKaZikJnCCwsZKFna
         HCHIv2zwPGw2A75XG6lWkyPnJejYpJzqpnarEiP9KZQfRtO03ElXuvSdOFoytRzVmXEY
         Hd8itcMcbhAMFSQSS84PpuwKlxTr3/xztbmN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688747809; x=1691339809;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JpC3g1AOkQLljsiPGkkcru7NhLVHI1qY2XmUAG/gcsY=;
        b=eYhLgIaLixU49OiTkwjYdijIsjThNhjZXv5BlRgn9XeeE0DYwoDLg1v6GuuJOx620b
         1to8fxrbdhCZHGkHMNxyLBMiPnQJFHUq7Y1LmOSUwMewYLEgGAqbcG29Gb5t6ARjXNDM
         yMtOQ71U9jrdJHocvAFfMOsNSrXJ4VKwrUqE720q+nwcK8s5rhCIuMK6Kg6Q/B48u3IY
         rcyMbuqF/Kisc6xhRoEBmFIin8+Y8l4aTKlcBabmMbnKNhGSQo0sAT4NjyL8j1faDOeY
         UDZOG5g9Q0qdayY1vVEy1BrlKHjFDGs+FR6twJN4JkiiT7RKM8l58Yh4RzAU5nbRrQ4C
         AVcA==
X-Gm-Message-State: ABy/qLb5XQm8d60aOjkISZScTrx4MKIZNr82VmBT0qZWVGQWHE4jfMen
	m8Lzy+COml0Ij/oNlWcJb474ZQ==
X-Google-Smtp-Source: APBJJlG8ZQN5vpAaIbjWzHx7dctYlJ7hG3lT2yLbiAnZRDDF+MA0kQ+60fEJ32T96OHVNnJF+/x63A==
X-Received: by 2002:a0c:f004:0:b0:632:952:4775 with SMTP id z4-20020a0cf004000000b0063209524775mr5057951qvk.57.1688747808844;
        Fri, 07 Jul 2023 09:36:48 -0700 (PDT)
Received: from nitro.local ([209.226.106.132])
        by smtp.gmail.com with ESMTPSA id x1-20020a0ca881000000b006301d3caba8sm2258280qva.50.2023.07.07.09.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 09:36:48 -0700 (PDT)
Date: Fri, 7 Jul 2023 12:36:39 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Erik Schilling <erik.schilling@linaro.org>
Cc: tools@linux.kernel.org
Subject: Re: [b4] Allow sending prefixes before [PATCH]
Message-ID: <20230707-bike-closet-braun-3ae8e4@meerkat>
References: <CTPW75Q2ISUN.251ELTNP6RB22@fedora>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CTPW75Q2ISUN.251ELTNP6RB22@fedora>

On Fri, Jun 30, 2023 at 11:54:36AM +0200, Erik Schilling wrote:
> libgpiod wants patches to be sent as [libgpiod][PATCH ...] [1]. However,
> b4 always sends [PATCH libgpiod ...]. I found no config switch to change
> that.

bugbot assign to me

-K
