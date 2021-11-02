Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEC768;
	Tue,  2 Nov 2021 08:38:09 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id A1AEA212BE;
	Tue,  2 Nov 2021 08:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1635842282; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bhqHykkhPF1Uazvvloq48w01nlK6vgSliSb9CJ3bdi8=;
	b=QzByEUjvVpdsZ2JALDVYenX3h5rms8q+0c0HplN/dPatQOsN5xmJ1f4UzgXRsyqQAXRypn
	rwyC9JWCUXz/2MeQ7L1ykte4WSxJ6NdXiSBQb0cCagbd/oe2lv6ORM9okaqQdg4+a7Z6k7
	TDfvUO2uy+736ZAcP8KMX+zX+JWoJXo=
Received: from suse.cz (unknown [10.100.224.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 81C97A3B83;
	Tue,  2 Nov 2021 08:38:02 +0000 (UTC)
Date: Tue, 2 Nov 2021 09:38:02 +0100
From: Petr Mladek <pmladek@suse.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4: unicode control characters -- warn or remove?
Message-ID: <YYD46giNXcGF0lCn@alley>
References: <20211101175020.5r4cwmy4qppi7dis@meerkat.local>
 <CANiq72k-n-u9nQAzE1yUPz-ioF+coas_rBOofyuJnBgdvTZ2Yw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72k-n-u9nQAzE1yUPz-ioF+coas_rBOofyuJnBgdvTZ2Yw@mail.gmail.com>

On Mon 2021-11-01 19:10:05, Miguel Ojeda wrote:
> On Mon, Nov 1, 2021 at 6:50 PM Konstantin Ryabitsev
> <konstantin@linuxfoundation.org> wrote:
> >
> > Per exhibit a, what should we do in the situation where we discover unicode
> > control characters in an email?
> >
> > 1. Warn and strip these chars out, because they are extremely unlikely to be
> >    doing anything legitimate in the context of a patch (unless someone is
> >    sending patches for docs actually written in RTL languages)
> > 2. Warn and error out, refusing to produce an mbox
> > 3. Just warn and produce an mbox anyway
> 
> I think option #2 would be the best + a flag to override the error (to
> be used if the user has verified it is legitimate).

Yes, please add a --force option to override these kind of errors.
It should be used only when users know what they are doing.
The point is that they will have a chance to check, fix, and
eventually apply the patch.

For example, I was not able to get a patch that was sent as a followup
to a patchset by another user. The original patchset was sent
from @infradead.org. The followup patch from @suse.com.

b4 refused to get it because attestation failed:

$> b4 am -o in YXlKqCPY9suM4mfT@alley "-P "
Looking up https://lore.kernel.org/r/YXlKqCPY9suM4mfT%40alley
Grabbing thread from lore.kernel.org/all/YXlKqCPY9suM4mfT%40alley/t.mbox.gz
Analyzing 16 messages in the thread
Will use the latest revision: v2
You can pick other revisions using the -vN flag
Unknown range value specified: 
Checking attestation on all messages, may take a moment...
---
  ---
  ✗ BADSIG: DKIM/infradead.org
---
Total patches: 0 (cherrypicked:  )
---
Cover: in/v2_20211019_willy_improvements_to_pgp.cover
 Link: https://lore.kernel.org/r/20211019142621.2810043-1-willy@infradead.org
 Base: not specified
       git am in/v2_20211019_willy_improvements_to_pgp.mbx



I think that this has already been discussed somewhere and it is a
rare situation that is not easy to support. Anyway, the patch
was trivial, correct, and --force option would have helped me
to handle it easily.

Best Regards,
Petr
