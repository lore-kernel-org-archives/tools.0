Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003973480
	for <tools@linux.kernel.org>; Tue,  3 Aug 2021 16:03:17 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id t18so14263302qta.8
        for <tools@linux.kernel.org>; Tue, 03 Aug 2021 09:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LOuvsiOhltm2nGZRDfW/D8JztFuwlELmQaPu99WEYr0=;
        b=LXwE/JiJ33Q/LbmWwbuMURHlzvDgT0oiykFWHsmy4MoClSw9YOCVDpVm92MA4KD0BL
         0q8HtitFnI35uQ5ZLnveZeWdtTZkSLzGtkn7ZGE+3CE2Snl50aGyTo4V9tMnJq8yCq8z
         rEZui9i4YS8JyzljjuwJTklBIIHiCWJfdwcQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LOuvsiOhltm2nGZRDfW/D8JztFuwlELmQaPu99WEYr0=;
        b=hCT5VGgMM8u5PZgUigFv1XDOjg3GOi8IE+w6iv1hJaeYcIjy+L8DMPV2DNQSU4CV0y
         L0VfyzO8eWg9mPSO9xOdljHQIEGaTAuNwlpnWwYZXIYD7mEgyd6d9LioiNgpM4jLl0Nf
         mACXRsdUHUZFxd2OpFmeV7GIQkOYiPSlkQhDJr4va7njFKk1GnuK//CLhtB9pv55afhm
         zdQiuzVuvmhGMsJt1ee6TmzmDNKJeky14TJ0wXrZupzqFpqI5IQklcpq+4BCgLXsQ/xS
         cxxYSGHy2t43o7LjUru0A28tY6KzaW+ZtYFhmanxhZyrpujS6uQUQhFie48kdcN0J6Tn
         QnDQ==
X-Gm-Message-State: AOAM533F+szNBCj0Eir7LvPlqlE/DwmIZ/fz34Jlu5vdBLdanXTGcuti
	Gk+hQoO6KjDZMhPQptAdy7FlCQ==
X-Google-Smtp-Source: ABdhPJyV/5K1wV4oBvQg3OALFFfRQ7Yy4ueI4MylCMd40Q71O/4wlfK+0wbcxca5JPfegGknK3TxeQ==
X-Received: by 2002:a05:622a:1105:: with SMTP id e5mr19292021qty.268.1628006596916;
        Tue, 03 Aug 2021 09:03:16 -0700 (PDT)
Received: from nitro.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id j127sm7917482qkf.20.2021.08.03.09.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Aug 2021 09:03:16 -0700 (PDT)
Date: Tue, 3 Aug 2021 12:03:14 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Kyle Meyer <kyle@kyleam.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, tools@linux.kernel.org,
	users@linux.kernel.org
Subject: Re: [PATCH b4 0/2] Avoid decoding errors when extracting message ID
 from stdin
Message-ID: <20210803160314.dwor36uc4md4sa6u@nitro.local>
References: <20210717212631-mutt-send-email-mst@kernel.org>
 <20210718043406.26727-1-kyle@kyleam.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210718043406.26727-1-kyle@kyleam.com>

On Sun, Jul 18, 2021 at 12:34:04AM -0400, Kyle Meyer wrote:
> Thanks.  I can trigger that on my end too.  Here's a possible fix.
> The first patch is the actual fix.  The second patch makes this code
> path do a little less work but isn't necessary.
> 
>   [1/2] Avoid decoding errors when extracting message ID from stdin
>   [2/2] Parse just headers when extracting message ID from stdin mbox

I've applied 1/2 and partial 2/2. In the case of b4/pr.py, we actually want to
parse the entire message, not just headers.

Thanks!

-K
