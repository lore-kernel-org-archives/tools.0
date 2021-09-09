Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C893FCD
	for <tools@linux.kernel.org>; Thu,  9 Sep 2021 14:48:40 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id x5so1594267qtq.13
        for <tools@linux.kernel.org>; Thu, 09 Sep 2021 07:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+blCSXYwnlkhJaxwZ7k++s5v6gh3GPcn8n6NCijDu2o=;
        b=B5nUWvJaPKMJPsBoEBcQHiNx7bVLNldNjwes72eg8gbDyI4buAQkBN4QODSD5lZS+J
         PBkQa2fdxjeX519pqQIRJHFF1bxrzhxNnyrN0HWqhHK0VNoCTlerzmp4M7wmI0T9T9DJ
         r7FhhQN8/HYxehvHLUSlRZ86IAWA3E3vvbhCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+blCSXYwnlkhJaxwZ7k++s5v6gh3GPcn8n6NCijDu2o=;
        b=zhNuk0AQd8tzNbXq5dPH34k+AZNrPFcEhbZTJ29yLyXgUUxKT3AZ0CM/Q54EOo3qkq
         p6cd2cecgXf9mFXr0GqKYdV75lRcXnxsSHisf5lt8TQgb8nJekQHVXnV1+gCmoiRFo0C
         /VIcsUxfVHT3BxSu1RMnv03g2/XkscsBrUnvs1/VdLuKqrqMszytF9Ye/ntFBE+bav4I
         NzEIBSsA7GuNEgyzYi3Q5kvpjciSMG9GH8wbEsCApPkZfl534KUu27MWSGkc4/dNT0lw
         cSaBgQzB6zV74aGidWJaoTf6fUUrkURbPqkQbziYcWSP2BkGhSY4AesmOgyu3jquCqNF
         lV8A==
X-Gm-Message-State: AOAM530EIZrda0YX4bWirh18NQQr1ml6wtVbtUhN02Ils/d+Bz1kqDGK
	6oET4oPDD3MdUDw+VEDDIREgUA==
X-Google-Smtp-Source: ABdhPJyZiQI/etblZOz0eJZFR05YzrMSkIS61ggwrgclPmIhBH8y53KRHitSmOBZV2ixNzqqP4lriw==
X-Received: by 2002:a05:622a:1999:: with SMTP id u25mr3229875qtc.383.1631198919222;
        Thu, 09 Sep 2021 07:48:39 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id z20sm1239822qto.71.2021.09.09.07.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 07:48:38 -0700 (PDT)
Date: Thu, 9 Sep 2021 10:48:37 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Theodore Ts'o <tytso@mit.edu>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	David Howells <dhowells@redhat.com>, users@linux.kernel.org,
	tools@linux.kernel.org
Subject: Re: lore.kernel.org upgrade: Sep 1, 2021
Message-ID: <20210909144837.juh5ig2q7wrtxlpv@meerkat.local>
References: <20210830164626.tq5emfrht4o46x33@nitro.local>
 <398626.1631181532@warthog.procyon.org.uk>
 <20210909123150.fgo7vma4i32t36mg@meerkat.local>
 <CAMuHMdUufV8dNWuqwDa5oAt0k9KiJB06W7xLAR8=phWVWmp0wg@mail.gmail.com>
 <YTobOk4+cUkHWvc6@mit.edu>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YTobOk4+cUkHWvc6@mit.edu>

On Thu, Sep 09, 2021 at 10:33:30AM -0400, Theodore Ts'o wrote:
> That would mean that lore would have access to a large part of your
> search stream.  Some might consider it to be privacy concern, unless
> the LF wants to introduce a privacy policy promising they won't try to
> monetize that as an income stream?  :-)

!! Hot Seattle plumbers are eager to webcam with you, Ted !!

(literally true, sue me)

-K
