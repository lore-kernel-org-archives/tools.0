Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB4F33F4
	for <tools@linux.kernel.org>; Tue, 21 Jun 2022 15:55:34 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id cf14so10216301edb.8
        for <tools@linux.kernel.org>; Tue, 21 Jun 2022 08:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fmxNIZCyRROVj4XgYXcq+wg46UI2YIvRF8SqEdoAZFM=;
        b=NdNFIGi4MY9HTkmiAj0/XSCAPnRkJly8EK9qAmvfQJaOallAA0CAit69HpWpooaaoo
         Ri5067Orpt2M95Zepky2rGkCqFfA9TFbFF/YcJtVQpsv3clLCuaS1Yojv3cLQga1NPOM
         yvQeN7I9sS0mnNc9usTt8bRwtKH/sKsBBUzEQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fmxNIZCyRROVj4XgYXcq+wg46UI2YIvRF8SqEdoAZFM=;
        b=ASx9kJL0y7/UDOBLiED5jbf8w3PPgKcOSEUw5irYiXgmgwikftxAo8hQhp4DE1Wzgf
         uKv4IJ6vFjOE/Usf2cDxZ/yPL9kq/pfwvOktgUUhNLcEeteAtFhJRLZNSpwOsStoPSfB
         lsSgpthSau4/A+jUZC5f9/mwadL0u0Ww3PeZq70Y5eSviZ+F9nNnvBErVranDk1JYx+D
         HnZMGZEabwrZMPgLuy3VgHVZJpnkJpaqnN7SgTYG7WrIl8WkaPrj8WDxkKBhm2ImK0T4
         Got/O0S+dZlZXGen6f/Q3d0T0u1Pq9JJl1i/CUVS6FLOtDWGvRpbgA67dJPfurb6+SEu
         FfYQ==
X-Gm-Message-State: AJIora+L7JwY8cqb1J06VZ3vWN0LCwFHHxw/0nwTOH5f0OUEtNYlkR8D
	pvAUkBJIu97BZF2jhOKdQ69J66/qr2XcJZxs
X-Google-Smtp-Source: AGRyM1tCzPkvTeJCACt51TrsVmCsMUS0mHZccYWLoebU4egUrQiTS0W7wEv2R11yXO9zo6KzzlaeVg==
X-Received: by 2002:a05:6402:3551:b0:431:51e1:856f with SMTP id f17-20020a056402355100b0043151e1856fmr36481047edd.323.1655826933088;
        Tue, 21 Jun 2022 08:55:33 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id 17-20020a170906211100b007109b15c109sm7866758ejt.66.2022.06.21.08.55.32
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jun 2022 08:55:32 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id w17so19546939wrg.7
        for <tools@linux.kernel.org>; Tue, 21 Jun 2022 08:55:32 -0700 (PDT)
X-Received: by 2002:a05:6000:1251:b0:21a:efae:6cbe with SMTP id
 j17-20020a056000125100b0021aefae6cbemr22372924wrx.281.1655826931735; Tue, 21
 Jun 2022 08:55:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20220617190153.tvi5lkzlvemeqou5@meerkat.local>
 <CAMuHMdV4AHH1TM6xf26MP0-dUQ0-fB+62GeeuVuth9pgWgdu7Q@mail.gmail.com>
 <20220621152903.czivp7fdn6me775i@meerkat.local> <CAMuHMdWz8=Zr8hnXNGBZVfe70F8oVdK670Z41=Dtib0GMDgAug@mail.gmail.com>
In-Reply-To: <CAMuHMdWz8=Zr8hnXNGBZVfe70F8oVdK670Z41=Dtib0GMDgAug@mail.gmail.com>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Tue, 21 Jun 2022 10:55:15 -0500
X-Gmail-Original-Message-ID: <CAHk-=wiQzp+aurcmj15=LAa2ntvRZH0Ee2dn-PLjcFpmRE6Jcw@mail.gmail.com>
Message-ID: <CAHk-=wiQzp+aurcmj15=LAa2ntvRZH0Ee2dn-PLjcFpmRE6Jcw@mail.gmail.com>
Subject: Re: b4-0.9.0 available
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, tools@linux.kernel.org, 
	users@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 21, 2022 at 10:41 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> FWIW, I follow the chain-of-custody ordering.

I don't think different kinds of links have any particular ordering,
but yes,the "Signed-off-by:" ones should basically be sorted by
"author -> email chain -> committer" order so that you can see which
actual "path" the patch took.

               Linus
