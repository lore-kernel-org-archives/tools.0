Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEEDE173
	for <tools@linux.kernel.org>; Sun, 18 Jul 2021 01:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626572365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iPT+7dbPC2tyWJs/5+v1Uabp4jMScnWZPSOQfrSJVQ8=;
	b=MbbiO/yK7hLYQETw+i72/OkPojyGSdc5KjvaPNtlAczXvgwWzWjEJ/cbrWdJgI+MUOOWwX
	gTEBnMxGcHR1JTaYuViGiAsvqji5Pzg8Q3uR7OdOr4qJN7FHO9gNF+ZQtAs5cN586UWhtf
	ES4pqSWRnjTLsSVhRVb95ui/bE2mXFk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-B7apEe9UNva-D00vGaXhuQ-1; Sat, 17 Jul 2021 21:39:24 -0400
X-MC-Unique: B7apEe9UNva-D00vGaXhuQ-1
Received: by mail-wm1-f69.google.com with SMTP id 7-20020a05600c22c7b0290227b752f429so1566681wmg.4
        for <tools@linux.kernel.org>; Sat, 17 Jul 2021 18:39:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iPT+7dbPC2tyWJs/5+v1Uabp4jMScnWZPSOQfrSJVQ8=;
        b=bv4XTT8X7fJXq14lxthFoQCbx5lGlWv6MLiLLwRBbvn/W1TO1kaox9PFg29g7C43TO
         zKzevodp5k3DcGx71kOGeIdVztTu8Ngdrz5Vg2AkT0+3SV+MqowuBaEjoVVukXWxMTe1
         7xRMJ4Wy7UMVEdnUyp5u2BLQMpmQx6lNRM08y+Kdvhc8yqezAgpPmpHxPspTy4Vqyi+G
         M4JCjHyLyzAyQ4XV0BYmghBxOiLGYYqNFPGAxLm5wFTm6iaqfyYuZDYJz66Uvs4oErpI
         yfvxcrrG9Bb3r01bxV00xRPERJto7ptJC2sa8uRD4c28I+Slo3ysBsoplzG7/tH1Ag2X
         a86A==
X-Gm-Message-State: AOAM531qooEgTSjvsYNueNMLG89u4Rt+UbagbW6eTmhrzzXG84tzFWe8
	kmKm9H+S739H4KFNFAojnrAw/E2yZZLGiG2t0sZYgPWmXGQhxPRfJJ1ZuXZ5B7hjPXSeoB4IPP2
	MVuL8a0edSoJAwgRC
X-Received: by 2002:adf:f642:: with SMTP id x2mr21863386wrp.37.1626572362946;
        Sat, 17 Jul 2021 18:39:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLhor0KNEiYmqpfloSC2MJzVPMQohWZaRyw1AU7+9iD4AUPVUnyIQegv+P+DkKRJpioYYAgA==
X-Received: by 2002:adf:f642:: with SMTP id x2mr21863370wrp.37.1626572362733;
        Sat, 17 Jul 2021 18:39:22 -0700 (PDT)
Received: from redhat.com ([2.55.29.175])
        by smtp.gmail.com with ESMTPSA id z16sm15832651wrl.8.2021.07.17.18.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jul 2021 18:39:21 -0700 (PDT)
Date: Sat, 17 Jul 2021 21:39:17 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Kyle Meyer <kyle@kyleam.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: utf-8 issues on b4 master
Message-ID: <20210717212631-mutt-send-email-mst@kernel.org>
References: <20210717164836-mutt-send-email-mst@kernel.org>
 <8735sc63hh.fsf@kyleam.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
In-Reply-To: <8735sc63hh.fsf@kyleam.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jul 17, 2021 at 05:21:30PM -0400, Kyle Meyer wrote:
> Michael S. Tsirkin writes:
> 
> > Passing message id
> > bbe52a89-c7ea-c155-6226-0397f223cd80@linux.alibaba.com to b4
> > gives this backtrace:
> >
> > Traceback (most recent call last):
> >   File "/scm/b4/b4/command.py", line 263, in <module>
> >     cmd()
> >   File "/scm/b4/b4/command.py", line 246, in cmd
> >     cmdargs.func(cmdargs)
> >   File "/scm/b4/b4/command.py", line 41, in cmd_mbox
> >     b4.mbox.main(cmdargs)
> >   File "/scm/b4/b4/mbox.py", line 581, in main
> >     msgid, msgs = get_msgs(cmdargs)
> >   File "/scm/b4/b4/mbox.py", line 523, in get_msgs
> >     msgid = b4.get_msgid(cmdargs)
> >   File "/scm/b4/b4/__init__.py", line 2080, in get_msgid
> >     msgid = get_msgid_from_stdin()
> >   File "/scm/b4/b4/__init__.py", line 2072, in get_msgid_from_stdin
> >     message = email.message_from_string(sys.stdin.read())
> >   File "/usr/lib64/python3.9/codecs.py", line 322, in decode
> >     (result, consumed) = self._buffer_decode(data, self.errors, final)
> > UnicodeDecodeError: 'utf-8' codec can't decode byte 0xd4 in position 5886: invalid continuation byte
> >
> > mutt does not seem to have trouble decoding this ... weird.
> 
> I'm confused by that backtrace.  I think get_msgid_from_stdin() should
> be called only when a message is fed on stdin.  You say you're passing a
> message ID.  That's as a positional argument, right?

Sorry. I passed the message on the stdin. I supplied the
message ID so you can get the original from the list archives.

To reproduce:

wget -O - https://lore.kernel.org/lkml/bbe52a89-c7ea-c155-6226-0397f223cd80@linux.alibaba.com/raw | b4 mbox





> Fwiw I wasn't able to trigger the issue on my end.
> 
>   $ b4 am bbe52a89-c7ea-c155-6226-0397f223cd80@linux.alibaba.com
>   Looking up https://lore.kernel.org/r/bbe52a89-c7ea-c155-6226-0397f223cd80%40linux.alibaba.com
>   Analyzing 5 messages in the thread
>   ---
>     [PATCH] virtio-balloon: Use virtio_find_vqs() helper
>       + Reviewed-by: David Hildenbrand <david@redhat.com>
>   ---
>   Total patches: 1
>   ---
>    Link: https://lore.kernel.org/r/1626190724-7942-1-git-send-email-xianting_tian@126.com
>    Base: not specified
>          git am ./20210713_xianting_tian_virtio_balloon_use_virtio_find_vqs_helper.mbx
>   
>   $ b4 mbox bbe52a89-c7ea-c155-6226-0397f223cd80@linux.alibaba.com
>   Looking up https://lore.kernel.org/r/bbe52a89-c7ea-c155-6226-0397f223cd80%40linux.alibaba.com
>   5 messages in the thread
>   Saved ./bbe52a89-c7ea-c155-6226-0397f223cd80@linux.alibaba.com.mbx
> 
> That's with
> 
>   Python 3.7.3
>   b4 v0.7.0-32-g45ef591
>   patatt v0.4.6


b4 v0.7.0-32-g45ef591

python3-3.9.5-2.fc33.x86_64

I don't know about patatt.

-- 
MST

