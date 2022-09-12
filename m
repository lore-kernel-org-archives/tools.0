Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275972CA2
	for <tools@linux.kernel.org>; Mon, 12 Sep 2022 20:47:49 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id j1so7686689qvv.8
        for <tools@linux.kernel.org>; Mon, 12 Sep 2022 13:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=eEDYY8jNn/9ln73zuM8OqRWC1Dy23DyzZ1RyLuM2Xb8=;
        b=MO2xpah7GIZEZreimO4skzORExtmvOsJ2+Xi6LlLsQF1+RhFzfpsEMNNe1rin195Bb
         X68ktPgjIsfOvba2vv1V0blDJay5QeQt1fgVgfZJCvftfnMJ0cgecCqoUnAYRZT/OSGa
         iKlB5YKFrmEzABW4UqndePwmqQIBohuco8AsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=eEDYY8jNn/9ln73zuM8OqRWC1Dy23DyzZ1RyLuM2Xb8=;
        b=Qvf6VoxxH2XYP3URbDQ5jKBJyFsC0q1SbkBuAvGzcjUPsrA+1kluhQ9bpoJiES5sxT
         FEtHoX/wm/ZZnOQ+XyjClvINwnCRkh+rW/HIJmYqtfZ08f/JrTzvjfCiT1GZuUKEGqfM
         wTtjvEKg3xi57uKvs9axVm7gyjqfar2TNTIUG0zXs697qTuiQToHHumqgY+4Qv1eZW/3
         2nIWLO3t907zdtqOKeqZDUgYiAC+SnEkSjPFN4mWatQg6s2Pui9JVStLM0qNsP8+yYny
         x115qNoZBDXXQ417AkM6ACvciiV0eeqjJt3dm3Pne3V7rtJXWaYP0XvOosXzXAI7wzFI
         bcRA==
X-Gm-Message-State: ACgBeo2/L7tHqdi981SsMXDa82uQtyrk89B4vYcGBLAah/yZtaf6Xzjf
	34tiTpqeHqPJqJV22c5Xz3fheA==
X-Google-Smtp-Source: AA6agR7W0WkjcawcJ8slF878wHxrgVQ0NGJDJywtNrzEr2jUXXL66PKsbSar6zmPG2sbcpK31pAJGA==
X-Received: by 2002:a0c:b288:0:b0:4ac:a9ef:52f8 with SMTP id r8-20020a0cb288000000b004aca9ef52f8mr8862971qve.28.1663015668007;
        Mon, 12 Sep 2022 13:47:48 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id h63-20020a376c42000000b006b8d1914504sm8663177qkc.22.2022.09.12.13.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Sep 2022 13:47:47 -0700 (PDT)
Date: Mon, 12 Sep 2022 16:47:46 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: tools@linux.kernel.org
Subject: Re: Couple of bugs(?) in b4 send
Message-ID: <20220912204746.thhy4sjgmiqkf646@meerkat.local>
References: <20220908201359.tlm3tlykpsm5j3iu@ldmartin-desk2.lan>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220908201359.tlm3tlykpsm5j3iu@ldmartin-desk2.lan>

On Thu, Sep 08, 2022 at 01:13:59PM -0700, Lucas De Marchi wrote:
> 2) --no-auto-to-cc either does too much or too little

So, here's what the latest master has:

    b4 prep --auto-to-cc

This will run get_maintainer.cc and add the resulting To: and Cc: trailers to
the *cover letter* of the series. This should allow developers to fine-tune
who should be the recipients by running "b4 prep --edit-cover".

At the send stage, there are two new options:

    b4 send --no-trailer-to-cc

This will ignore any addresses found in trailers (which is mostly useful for
testing).

    b4 send --hide-cover-to-cc

This will omit the To: and Cc: trailers from the cover letter (but still send
to them). Mostly, this is a cosmetic option that makes the cover letter look
less cluttered when there are lots of recipients.

-K
