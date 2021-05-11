Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5AF71
	for <tools@linux.kernel.org>; Tue, 11 May 2021 20:56:32 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id r13so10950920qvm.7
        for <tools@linux.kernel.org>; Tue, 11 May 2021 13:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=tY+DZAj7XqnzPLbj7tYHSaLRjglKlAvr6ejW7RWEBeA=;
        b=DrQK+C+Vf2lBveLIh+ohQRDpf2RA0QQXDk9J4w3IVBaJ1ShgewJL0v+69WMpdEIG/S
         kgcGB62mzwfzJmw1erXRUETJHHFHv/L/XxYbhWlRUxg1hcY+MrZsSx1iL31BG6OrWG7U
         frFhJAK8O71Bw0Bwbf6IUZMmdHfO8YkadXI94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=tY+DZAj7XqnzPLbj7tYHSaLRjglKlAvr6ejW7RWEBeA=;
        b=qKwyh8LpVs9MXKZliX5dWLxZGHMDUBqiadQlzxmYEqsR0LUvlXrtZDFNI+/cFWFmXq
         oWmH0jlP40SG6aqtH7NyLLDZJ/IFWqxN0RMAccn6OCbSKg5SQGqnrp7KePjsS+wO6nSE
         HkYUaCdvkfO5hgKkEft1ONRI5CcDEgmhxqprpkyXomBXirMBo8+o9rp3R8Nx8J3mmpxp
         xnhiPLY/PKB/Pgtf+fAAIThw3TW51OjRaQWvcqOtlEZzRYLgqeNfrvpZfvce+WkNgmwU
         6SY2rgcxJMfHGlu9bwmt5lV/74R9SZvas/ZONI5Zmsq/ukKvx36dNtDslYyheV2750oz
         /tkw==
X-Gm-Message-State: AOAM5325INiqeDSCCURECE8AvQ1feQh6rfYH6d73Par8WEvwos9ieTNi
	kKt4DZtNGYvN80CfZNkSisy9mw==
X-Google-Smtp-Source: ABdhPJyzMvg0jzCQiWoehn0XGrbeqRFjGK+dq/wOIMDfRTWfphjqkIbe09Qny0KQvxdcaK2D1fWhkg==
X-Received: by 2002:a0c:bf4b:: with SMTP id b11mr31975050qvj.11.1620766591087;
        Tue, 11 May 2021 13:56:31 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-18.dsl.bell.ca. [216.209.220.18])
        by smtp.gmail.com with ESMTPSA id e17sm14658887qto.59.2021.05.11.13.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 13:56:30 -0700 (PDT)
Date: Tue, 11 May 2021 16:56:29 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Eduardo Habkost <ehabkost@redhat.com>
Cc: tools@linux.kernel.org
Subject: Re: b4 ignoring patch 1/2 on series
Message-ID: <20210511205629.dfe3zaooh7e7ose2@meerkat.local>
Mail-Followup-To: Eduardo Habkost <ehabkost@redhat.com>,
	tools@linux.kernel.org
References: <20210511190112.u724u6roghnfx432@habkost.net>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210511190112.u724u6roghnfx432@habkost.net>

On Tue, May 11, 2021 at 03:01:12PM -0400, Eduardo Habkost wrote:
> Hi,
> 
> I'm trying to understand why b4 is ignoring patch 1/2 in the
> following series:
> https://lore.kernel.org/qemu-devel/20210430134830.254741-1-ckuehl@redhat.com/
> 
> I see in the debugging output that b4 recognize both patches, but
> only the second patch is written to the mailbox.  Does anybody
> understand why?

It's because of the [RESEND] in the subject -- I need to fix this to be more
forgiving. This is the convention we recognize:

  Subject: [PATCH RESEND x/2] 

Right now, b4 drops all the [] items in the subject until the rightmost set,
because that's where it expects to find series information. Unfortunately, if
there are other [] items after [PATCH x/n], b4 will look into the wrong
brackets.

I'll try to fix it tomorrow, but for now you can do "b4 mbox" to get that
thread, then manually edit the mbox file to remove the [RESEND], and then run
"b4 am -m that.mbox".

Regards,
-K
