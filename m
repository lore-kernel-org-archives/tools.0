Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BECA48
	for <tools@linux.kernel.org>; Thu,  1 Sep 2022 21:32:12 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id h22so169965qtu.2
        for <tools@linux.kernel.org>; Thu, 01 Sep 2022 14:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=C8UZl3wfLVpJJVaXmJkf5wRIfDlyWdUwatA8KQp/RQs=;
        b=FJheJA1QN7pLVWc85HFLSb40IC0gpou23+FvvMUiHPFjyvtw/fvlAYky34CdB82Oh9
         HOcsSBK1xnohFzqK0+0VLUmVou49ukvHI/7mmLZysxXgW+QtYZmkfrLClOMgFepg9mkc
         dLs0e/VGZrleeQIxvgP2dbNdhxKvaPEzsGtes=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=C8UZl3wfLVpJJVaXmJkf5wRIfDlyWdUwatA8KQp/RQs=;
        b=rKCQDdP08hmNjibkgEThanVDm0gG2yaJZoX53VvBvTzgSt27CrvV9IegrvH+TfjQYq
         i/PboB/5wetdTWRWJknW4Ggw0EpJHCQMf6E/NMdy4jn7A9xEyOKWp9qklY6oU956zneW
         58mifCvFGIiqWoKyedOmqRUV9AD36cvFXSPzZ5ytKuv7iGnqLAAAtk8OWVxTrrYxtQ+u
         abyHzinDX+bxbh0HgxtzgFT4Rl7lIVp2tnXf1u+3zysgAhtr6WU499aPPEG4G++sHJNd
         r+w9SZRKsUlOI+Zy4Ff7sF7T7Dus0nLFpDq9Nh+Kf7XWFdq7xXkde4WmH9d9DEQK6y3s
         m9uA==
X-Gm-Message-State: ACgBeo0uKUTYvzILKoAWQkFub9ADuF6/uJ5eDdpMDsYsmty/9pvoxK7X
	28LtmOO9TNz2+UGgL6zwIcFag1QbM72erQ==
X-Google-Smtp-Source: AA6agR7dQ5auOFbvDT2s/qBsftTYSiO9Wfpaja9eTQ9wXTEOM/n7AfU6OIL8Whl3h0QK3Pyo2Hp8XQ==
X-Received: by 2002:ac8:7d96:0:b0:344:8cb0:ae8b with SMTP id c22-20020ac87d96000000b003448cb0ae8bmr25883299qtd.628.1662067931593;
        Thu, 01 Sep 2022 14:32:11 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id k19-20020a05620a143300b006bb83e2e65fsm45515qkj.42.2022.09.01.14.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 14:32:11 -0700 (PDT)
Date: Thu, 1 Sep 2022 17:32:09 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Philippe Blain <levraiphilippeblain@gmail.com>
Cc: tools@linux.kernel.org
Subject: Re: Using b4 with full URLs still uses lore.kernel.org by default
Message-ID: <20220901213209.hpoqzskcozhkxnqn@meerkat.local>
References: <f2b0f3c1-d98d-979d-1513-18f2491f4267@gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f2b0f3c1-d98d-979d-1513-18f2491f4267@gmail.com>

On Tue, Aug 30, 2022 at 01:00:20PM -0400, Philippe Blain wrote:
> $ b4 mbox -o- https://inbox.sourceware.org/gdb-patches/cover.1661868744.git.aburgess@redhat.com/T/#t
> Grabbing thread from lore.kernel.org/gdb-patches/cover.1661868744.git.aburgess%40redhat.com/t.mbox.gz
> Server returned an error: 404
> 
> It does work correctly if I set 'b4.midmask' to 'https://inbox.sourceware.org/r/%s'
> in my local Git config file, but sometimes I used b4 outside of any Git 
> repository just to transfer threads to my IMAP account (piping b4 mbox to git imap-send)
> so it would be convenient if full URLs were not re-written.

Okay, I pushed a change that should allow you to do that, but this will only
reasonably work with "b4 am" or "b4 mbox". To properly work for all other
cases, the midmask and linkmask settings need to be properly set to point at
the proper server, e.g.:

[b4]
  linkmask = 'https://inbox.sourceware.org/%s'
  midmask = 'https://inbox.sourceware.org/%s'

However, for what you are trying to do it should work now. The change is both
in master and in stable-0.9.y. If all goes well, I'll release 0.9.1 tomorrow.

-K
