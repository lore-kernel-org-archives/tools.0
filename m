Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD1A2773B
	for <tools@linux.kernel.org>; Fri,  6 Jan 2023 19:20:21 +0000 (UTC)
Received: by mail-vk1-f174.google.com with SMTP id 6so1055467vkz.0
        for <tools@linux.kernel.org>; Fri, 06 Jan 2023 11:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V1R91iwDD+5b7RDn32Iak8+wtPQQKWdD6425L/aBKjA=;
        b=Bcftm7YSVyQAcpnZQgJZ41xloz/VEvL4PPNtEN8Afqe/IyjalMhPRT8O3lIu/TfjYO
         /EQ9GanFlhx0YIHHVHBkb7smEWhVQ+JgoDFCXzb6Q8LXT+j6DRWLG3T/ZmtxWcHRg7a4
         b1ahjTDnPL6W/EvkZTF5xmfxl4HB57FSFumjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V1R91iwDD+5b7RDn32Iak8+wtPQQKWdD6425L/aBKjA=;
        b=m9IredcFIZkD+1+78DDtr7rat03QNV5g3FXllP8mz/wpBYz9IN74/6pOTij3PbM2lI
         D9C9aEC18cbtWIydMeFG11SsN6Z6GIOmY6wFZJ8BB69Ypc2gI5c05Q+XzNyIynAQzWpx
         CQn6J8uyAqRAx/MdliFynTtPUCplU1xz9pYaeP33TdJIMH+wy29f2NyhqvjAzQIjTUnp
         9MqSl4Nk1mE/wDoVcAiXRxbmt4mfayGpSvpHoD0jC+ZO+/j0Wse4oVHksqf3aAi1uWeh
         ISWodcAwqic7KpslBMmbTxTj8iEgbmDz2LNZU+l5tlHqZIUe7gD72oa109x67so3hOew
         R8ng==
X-Gm-Message-State: AFqh2kp/NTVcPsQZjhHHOtPg0WmcUVyejS9JLnuM+xpLLUk4PbZObMJ9
	h9Bv6sx7V2b2NwNMzoUQn0z9VEsT4uZJY/iB
X-Google-Smtp-Source: AMrXdXt45g/pYMeGOVyhnRllziu+wMf61ZJm3z5pH0RlqGGHyElVc2955tXOoTyv57W5o2OJim1ImQ==
X-Received: by 2002:a1f:4543:0:b0:3d5:b353:cc7f with SMTP id s64-20020a1f4543000000b003d5b353cc7fmr12264583vka.6.1673032820588;
        Fri, 06 Jan 2023 11:20:20 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id m7-20020a05620a24c700b006fc2e2198easm981778qkn.95.2023.01.06.11.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 11:20:20 -0800 (PST)
Date: Fri, 6 Jan 2023 14:20:18 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: Address from trailer on individual patch is sent entire series?
Message-ID: <20230106192018.ho5yfvj5xirh3ugy@meerkat.local>
References: <Y7d47SDIpjPBxEwi@dev-arch.thelio-3990X>
 <20230106163442.aziaoa3tndqtyisp@meerkat.local>
 <Y7hSRwJd8GbNUNeW@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y7hSRwJd8GbNUNeW@dev-arch.thelio-3990X>

On Fri, Jan 06, 2023 at 09:54:31AM -0700, Nathan Chancellor wrote:
> I am sure you are aware this contradicts what git send-email does, which
> is obviously fine in and of itself (I understand b4 is not a git
> send-email clone), but I am not sure this difference will be for the
> better.

Yes, thinking about this some more, it's probably best if we emulate the
most-expected behaviour of "what would git-send-email do". This still does
both, in a sense:

"b4 prep --auto-to-cc" collects addresses as returned by get_maintainers.pl
and will send these people/addresses the entire series. However, it will no
longer add addresses from trailers found in individual commits.

"b4 send" will send patches to any to/cc addresses in the cover letter, plus
any addresses mentioned in individual commits. The cover letter will still go
out to everyone, so an address from Reported-by in [PATCH 4/15] will get two
messages: [PATCH 0/15], [PATCH 4/15].

Will that be closer to your expectations?

-K
