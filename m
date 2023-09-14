Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011C21FA4
	for <tools@linux.kernel.org>; Thu, 14 Sep 2023 13:44:24 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-770ef903e80so65480385a.3
        for <tools@linux.kernel.org>; Thu, 14 Sep 2023 06:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1694699063; x=1695303863; darn=linux.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e8jSAiLuo9p2fWOKB4Kb4grKw9D6Y9JUnvQ8yQwEeQY=;
        b=A93LijLQwNOL3OCOsK4Knt8PudCMekUxp8yJOqz+KPrF5jLwI1UJf5TJVxd4x7gGB/
         fjq/wTsaLkvlkjIzdsmQQSQ4qvg4hcVuF6W600mbMTnbzZzhz6qbwnHcnPYue3pl17td
         EvmppTkJylCLdJWE9HGcaWGdyIOgaQWx0Pti8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694699063; x=1695303863;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e8jSAiLuo9p2fWOKB4Kb4grKw9D6Y9JUnvQ8yQwEeQY=;
        b=Vxn+1IUBpn3dl+JSBfmzfQh/p0w4r27ElUkFODKThf/eV4cXnIoz2RiKjtyaPplyB2
         N6QNPccNYagfxMqy//fuxOSlcJpnDd+bjCF0Ez1JndgsSoJZodhqjjTLPjs2HTljPTnL
         nYrlQ/8J7XpuAN4/OQO5XBeUhxJ5Ur7jjXM1IuiqTkhHnFh4TMNl/wyd2tvoXCGJIDW0
         uRCf6kD0BgdbaIi/HdS7WktnBc+XkH8tUBRcWgpbr7qK1MpKMWOxNkv3CHnTm6NEI1nm
         L0vcXNFL66iwXvTTkXM+nmraqCOSWfpUFgkc8pp4HcTiYxnq4goJ+4bNkwauVw3YAiz0
         pb3g==
X-Gm-Message-State: AOJu0Yx1otW4PMnHfWLIPyYDyQ6B1EYhM1Rz+GEB3xYkTeslrdOZCXAP
	7iC6Hbcr/kdw97ePvqTEUFi/ORv2nR7VcRpnSws=
X-Google-Smtp-Source: AGHT+IFNyH5idZOi5/sqO7yrWIZKv2we4JFv8PJhQ89C7gZPBT4Q1XMXmLVmozNMWCFqmz/5J6A3qg==
X-Received: by 2002:ae9:f814:0:b0:770:f1e1:202a with SMTP id x20-20020ae9f814000000b00770f1e1202amr5134250qkh.66.1694699063706;
        Thu, 14 Sep 2023 06:44:23 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-110.dsl.bell.ca. [209.226.106.110])
        by smtp.gmail.com with ESMTPSA id i11-20020a37c20b000000b0076e1e2d6496sm479187qkm.104.2023.09.14.06.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 06:44:23 -0700 (PDT)
Date: Thu, 14 Sep 2023 09:44:21 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Kees Cook <keescook@chromium.org>, 
	"tools@linux.kernel.org" <tools@linux.kernel.org>, Kalle Valo <kvalo@kernel.org>
Subject: Re: b4 tag parsing too lax?
Message-ID: <20230914-overstuff-dreaded-70e1ae@meerkat>
References: <202309131243.5D508355@keescook>
 <20230913-lunchbox-anemia-a19bc1@meerkat>
 <202309131601.979D5790@keescook>
 <ff72f308879a12f53fa7ace044ab99ab7dd9e060.camel@sipsolutions.net>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ff72f308879a12f53fa7ace044ab99ab7dd9e060.camel@sipsolutions.net>

On Thu, Sep 14, 2023 at 08:55:25AM +0200, Johannes Berg wrote:
> We use patchwork in wireless to assign the work between Kalle and I. I
> guess I could still apply patches using b4 though, but don't, at this
> point.

You can integrate b4 with patchwork, to a degree. At the very least, you can
pass patchwork URLs to `b4 am` and reasonably expect them to do the right
thing (as long as it's the version of patchwork that uses msgid URLs for
threads).

-K
