Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7D32CB6
	for <tools@linux.kernel.org>; Thu,  9 Dec 2021 21:31:49 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id i13so6349260qvm.1
        for <tools@linux.kernel.org>; Thu, 09 Dec 2021 13:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TwFmJSjmE3IpL6wU8MF85Fwntc3eC1CoRO+OphUV3qE=;
        b=Jo3GG1lCJIKX8HfSAKzxYDHPZYQ372p0jqO0H44ZXqsase1oXmt7ushiXGVLmlhMJ0
         L9Hyf4k2gH7cIsfJvVTzsXCyVeCFzWP7FBtSdTAoKR/tlRRFVdfDeNm9iIdpL3pvf6WF
         zOraBsKG7bzJewY+tEzn/4xhDL9UA/U/FZGfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TwFmJSjmE3IpL6wU8MF85Fwntc3eC1CoRO+OphUV3qE=;
        b=mBoisVE5TEniOSxyB4vm+bAOz8hx9zE/ReDk3IHVPjHzxEQnT7ydelP3lAYOPC6i6u
         8K3FWmb565djM5q/gHqi3+jpDuP3NHrZW8Q536WEK1EaZCNUr5ATldwes5cmQEfhumPE
         YW7XRH9aYfInTK/QFduBMAmlKgUnmGpxgl06w0aJD1EVgHRZvXQ92kmDmPDfke9QB1Ja
         aV6mJdISnBV7pIKw8wDVjU0iofnhAN3nZJv3SJhVWz6bj2G60H83JNvCjZ8jk1AI0X6c
         SGwW7QQVHWekz+YB5yCmEJe4blTWvk+fD+2Ci+PS14zobx5/IorUbpBWLnS0PDECSDgH
         7wiw==
X-Gm-Message-State: AOAM53072jbu/5xLWkKD0TG3cYs8WncFWgjrWReN7xcN57uOU8qrcrIe
	GNaEzJYy633CJINgPKh9yzKJbpQAx75tbw==
X-Google-Smtp-Source: ABdhPJwBOfQQic/yW2aX81lWgkC2cv2kFf3AOPHZuNzUnwh90oxFKen6E5DjyvoPja3Ms31nXUmnFw==
X-Received: by 2002:ad4:4b26:: with SMTP id s6mr21216171qvw.60.1639085508255;
        Thu, 09 Dec 2021 13:31:48 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id c8sm408959qkp.8.2021.12.09.13.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 13:31:47 -0800 (PST)
Date: Thu, 9 Dec 2021 16:31:46 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Rob Herring <robh@kernel.org>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: b4 splat
Message-ID: <20211209213146.h7r2a4iaba7qd27j@meerkat.local>
References: <CAL_JsqLgO5a282_w=gj1sjegTuwCchnUaR4TtwLX4JDLEkd29w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAL_JsqLgO5a282_w=gj1sjegTuwCchnUaR4TtwLX4JDLEkd29w@mail.gmail.com>

On Thu, Dec 09, 2021 at 03:08:52PM -0600, Rob Herring wrote:
> Hi Konstantin,
> 
> I'm seeing a splat from b4 on this thread. I briefly looked at it, but
> don't see the problem. The email looks pretty 'normal' to me.

We definitely shouldn't crash there, but the submitter indeed managed to do
something very strange:

Content-Type: text/plain; charset="y"

https://lore.kernel.org/all/20211209172206.17778-5-sumitg@nvidia.com/

Amusingly, we handle this weird corner-case in "b4 am" just not in "b4 mbox".


-K
