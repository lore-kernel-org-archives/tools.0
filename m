Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26AEC63B
	for <tools@linux.kernel.org>; Mon, 25 Jul 2022 12:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658751402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pAkgbuLWsrEwoHx0iu2VxkAK8SOviBWi+JmkEV509x8=;
	b=ZwiUVMrfVO5Yesx2zIky0eYODnyoaA1QqpA75JqJtljQlSITgw/TEj3fpe4jOrbYjqi5dT
	GNZadiSC9PVcDbAh6/CiG1l6dSwrQA5qTMjd0HSkaGzY9dXhPf9h9oF3Al3+oF9EXjQUyW
	twGxj45thJejlR44W1fd/T6m5y75maU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-85-X3UngdkxNpuHlSiCzJzlyw-1; Mon, 25 Jul 2022 08:16:41 -0400
X-MC-Unique: X3UngdkxNpuHlSiCzJzlyw-1
Received: by mail-wr1-f70.google.com with SMTP id t12-20020adfba4c000000b0021e7440666bso515560wrg.22
        for <tools@linux.kernel.org>; Mon, 25 Jul 2022 05:16:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=pAkgbuLWsrEwoHx0iu2VxkAK8SOviBWi+JmkEV509x8=;
        b=Ec1NXjEhxukE4F0tCB7KNnzoWtQbqVSivDUzvMrnXj8rDwyZ7z+kx/mPfz3TLbcash
         7rviuCIhz+hR6LEPpQYnXay4cN83efwtxZq582MY69HGjTSUgrOP2lyFnY3MYP8cXHmO
         0RLXPZ2WME9A+wFRO065Fw3QhWWxywyWVRiVpy5konLBQkfr2tWuJqimbvNHBMWo9Ngq
         VneZ3teoczmq2j/cKhQPBhyLQlrYtR88poBujgiaH13zfg2CSAEAHpOKecN5g9pYaAZT
         wZo4mFN4R4jNgWBdi6zuTn9g6z5bXsxGWHNyvI0GrNc6BlV56uMVUzsL+PiRVqDys+BE
         Ik/g==
X-Gm-Message-State: AJIora9JSUEgZTeFuJxm6GBDvRsQSRuWTUnOMJJ7dpDNxonjXImZu7yR
	kLfNlbTwx/HBookzVlU7WwZnY8UkgUNhQYRbr479UYGuVvTQ2yKcVdTCy9wEm4NY+X/ixc9JUKM
	s9Y8Q4FxBK+naxNCb
X-Received: by 2002:adf:f28c:0:b0:21e:5bec:14b3 with SMTP id k12-20020adff28c000000b0021e5bec14b3mr7492179wro.388.1658751399884;
        Mon, 25 Jul 2022 05:16:39 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sJD++Ir7Zme1KNNHVmTdh0l7ZNmlRvU8xBnwIaxVCeLEanwS/VcWZwSNayHzto+LllnhKQjw==
X-Received: by 2002:adf:f28c:0:b0:21e:5bec:14b3 with SMTP id k12-20020adff28c000000b0021e5bec14b3mr7492165wro.388.1658751399552;
        Mon, 25 Jul 2022 05:16:39 -0700 (PDT)
Received: from redhat.com ([2.55.43.166])
        by smtp.gmail.com with ESMTPSA id f8-20020a05600c4e8800b003a31673515bsm19858763wmq.7.2022.07.25.05.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 05:16:38 -0700 (PDT)
Date: Mon, 25 Jul 2022 08:16:35 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 submit ready for beta testing
Message-ID: <20220725081201-mutt-send-email-mst@kernel.org>
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>
 <4c4652b0e333bd81b91f71346ac6142322682eff.camel@HansenPartnership.com>
 <20220716145638.ubuwwc7xtjw6ugy7@meerkat.local>
 <6ad8ce3aa0d14d8a09a3c117affe19928a44f639.camel@HansenPartnership.com>
 <20220717160218.a5ccu4chbaoj3uxv@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20220717160218.a5ccu4chbaoj3uxv@meerkat.local>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jul 17, 2022 at 12:02:18PM -0400, Konstantin Ryabitsev wrote:
> On Sat, Jul 16, 2022 at 12:55:26PM -0400, James Bottomley wrote:
> > >  So, if you work on a series, send it off, and then pick it up again
> > > two weeks later from a different workstation, that's no good for most
> > > of what b4 submit needs to do. :(
> > 
> > Are you so sure that's the common case.  For me, to connect to an SMTP
> > server, I need to be on a system running my VPN, which is only my
> > laptop.  Thus however much I transfer the series around for testing
> > etc., it always comes back to the same system for submission, so
> > keeping the cover letter in the branch description of that system works
> > just fine.
> 
> Perhaps, but I also have other reasons to like using an empty commit for this.
> For example, it makes it very easy to mark where exactly our series starts.
> It's possible to do this with other tricks like tracking merge-base, using
> tags, etc, but they are a lot more complicated and have other caveats (e.g.
> when using merge-base tricks you have to also track the branch you forked
> from, and when using tags you have to also consider that someone may push the
> branch but not push the tags).

Very much this. Further, I hope down the road it will become possible
to keep serveral series stacked on top of each other.

-- 
MST

