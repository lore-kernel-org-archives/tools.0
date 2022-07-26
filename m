Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26AC2579
	for <tools@linux.kernel.org>; Tue, 26 Jul 2022 14:06:56 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id i7so10667978qvr.8
        for <tools@linux.kernel.org>; Tue, 26 Jul 2022 07:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zTPCX0n0geNQGyk2zxpWWBaJV2i4GTgNNgmeBBseJFE=;
        b=Db6kuI9Ua3TOl+J1Ox/IrobbTS51nn1gAl2HqgA0YYdcxExMUuVLu5Vki6CHtCIG2x
         73WATRalUwbT8Qk8JijvRS7du5y1zcYuCDB+kCtduvjXmrmCJEbTbZgZhEBrZJvlHXT+
         m26Lhf/f18ScNITPkfloYkflP43aNH/WOBCjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zTPCX0n0geNQGyk2zxpWWBaJV2i4GTgNNgmeBBseJFE=;
        b=rmj+eIkpToLfLRogg7/WqqTbY3COsOIP01BphUfbVCvbSuoJAhGt5TwcMNTfOdgWQs
         zYqndHcRTISYSbu92bAi70lnpqsTQIR0jGdmbfWvArKufIKgjPvVWtoaSCb1zyOPXB+t
         lSnGXlLPlBwy773m4AEAd784o+ABRmJ9jdvw4YbP3SU5I3dM2vzFafRd1Gcs70K65UvW
         9YVU3bzJk74wVNG1V0yQPpSZCOIwQOBr5sYUA8+iYgfVb18KeDc1hIsI5bKfbR7FE4pZ
         7FKCv9ii4sK8uLr/ISiFOE0aQLa7TvA4zNTxbaGEda6oVi3zOcEL//1BzL2hvRfaHJoe
         PWBw==
X-Gm-Message-State: AJIora+eb2b6QzXScRCI+yuEO3w7E5TR6y1wGexuH/mmH50ha9dBAgS/
	2k1FH+sG3WKG27VZhjoGMU6BcZSC5LvrEw==
X-Google-Smtp-Source: AGRyM1vshRtpzdrGbgxInP3xbEK8NSUfnggs6HmHfAiQlB/fKVlPm9MrXewsjOwOrOdC03wfWWPrlQ==
X-Received: by 2002:a0c:e04c:0:b0:474:499:5000 with SMTP id y12-20020a0ce04c000000b0047404995000mr14768545qvk.125.1658844415563;
        Tue, 26 Jul 2022 07:06:55 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-245.dsl.bell.ca. [209.226.106.245])
        by smtp.gmail.com with ESMTPSA id o63-20020a374142000000b006b5e3bf0eb8sm10984800qka.19.2022.07.26.07.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 07:06:55 -0700 (PDT)
Date: Tue, 26 Jul 2022 10:06:53 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Mattijs Korpershoek <mkorpershoek@baylibre.com>, users@linux.kernel.org,
	tools@linux.kernel.org
Subject: Re: b4 submit ready for beta testing
Message-ID: <20220726140653.iywuicmwli4v5sus@meerkat.local>
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>
 <20220720184835.uhnkucai54alhgo6@nitro.local>
 <87pmhs1d8h.fsf@baylibre.com>
 <02bd5767-6458-9015-484e-2c7156aa93a9@redhat.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <02bd5767-6458-9015-484e-2c7156aa93a9@redhat.com>

On Tue, Jul 26, 2022 at 03:55:25PM +0200, Paolo Bonzini wrote:
> On 7/26/22 10:37, Mattijs Korpershoek wrote:
> > The "ez-" part has, in my opinion, no added value for users. It
> > assumes that using these commands is so easy that "you can't use it,
> > you're really incompetent". I think we should use more "neutral" langage
> > for commands (without judging if it's easy or difficult).
> 
> I agree, and in fact I'm wondering if the series/send part really belongs in
> b4 (as opposed to a separate git-publish-like tool).  b4 right now is a
> lore-specific tool, while series and send apply generally to mail-based
> patch processing.

No, they really are very much intertwined:

- we rely on lore to retrieve trailer updates
- we use the change-id for series-tracking (via lore lookups)
- the web submission endpoint will be submitting to the lore backend system
  and written to public-inbox

This is why I kept this functionality as part of b4 and not a separate tool.

-K
