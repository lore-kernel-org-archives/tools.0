Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7AAF2FAE
	for <tools@linux.kernel.org>; Wed,  1 Sep 2021 19:17:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 36E151FF39;
	Wed,  1 Sep 2021 19:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1630523823; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=47DvYUO4YJIzjbXVrJNKDatLe1c+TIvQt77cquq0GSk=;
	b=TyzznkdcmGST3GCU4Pmn15jLMw/h2NnP/oS4kmVrngllp6FULw1ZUOSBe+hEvkl4YXB2qI
	/isiJGcWJWMPxkvC4+jReCubipYraScPZQUBrOiaCrPPnblkW80MPICxecOSFZHk1hWY6b
	Rowpvg/nT9/i1mze2W+HhxVrSGdSIsI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1630523823;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=47DvYUO4YJIzjbXVrJNKDatLe1c+TIvQt77cquq0GSk=;
	b=mOuviYjMmqdrIK0xTsSykF1J8cwQ9RsTKmXB9GAMzAVmxu4G/DosNM2ocrCuXflaXZkVQm
	BJ+dp804cmJGvtCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1DE1813B21;
	Wed,  1 Sep 2021 19:17:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id grPqBa/RL2GNcwAAMHmgww
	(envelope-from <vbabka@suse.cz>); Wed, 01 Sep 2021 19:17:03 +0000
Subject: Re: b4 v0.8.0 is available
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
References: <20210901141637.fmvgs4hnk6m4ym7x@meerkat.local>
 <582896df-8791-43f5-1422-db00e92b8291@suse.cz>
 <20210901180221.x2admzr4d3lymf3b@meerkat.local>
From: Vlastimil Babka <vbabka@suse.cz>
Message-ID: <dd60cb2e-bba5-c0fd-9166-8342053115cf@suse.cz>
Date: Wed, 1 Sep 2021 21:16:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210901180221.x2admzr4d3lymf3b@meerkat.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 9/1/21 8:02 PM, Konstantin Ryabitsev wrote:
> On Wed, Sep 01, 2021 at 04:48:05PM +0200, Vlastimil Babka wrote:
>> The earliest commit where it succeeds isn't that far away, actually:
>> git describe 2a03085ce887^
>> v5.13-257-gf356aeacf7bb
> 
> It may apply to that tree, but the patch series in question is showing
> different index values for the files being modified.  E.g., from the patch:
> 
>     diff --git a/mm/vmstat.c b/mm/vmstat.c
>     index cccee36b289c..31aada15c571 100644

Oh, so that's how it works, thanks.

> If we look at the mm/vmstat.c blob hash at the commit you listed
> (v5.13-257-gf356aeacf7bb), we'll see that the file has a different index
> there:
> 
>     $ git ls-tree v5.13-257-gf356aeacf7bb mm/vmstat.c
>     100644 blob b0534e068166c4d4df5995a2830fe548f48886b7    mm/vmstat.c
> 
> If we look for the object with index cccee36b289c, we'll find that it last
> existed on June 28:
> 
>     $ git log --pretty=oneline --since 2021-06-01 --until 2021-09-01 --find-object cccee36b289c --all
>     28f836b6777b6f42dce068a40d83a891deaaca37 mm/page_alloc: split per cpu page lists and zone stats
> 
> June 28th is over 2 months ago, while by default we only look within 2 weeks
> of the patch's sending date (otherwise it could be really, really slow). And,

I see. Too bad the search isn't faster, as it seems to know exactly what
to look for, but I guess that's how git works and indexes things.

> in fact, if we widen the search to 60 days (2 months before the patch was sent
> makes it June 19), we indeed find the exact match for this series:
> 
> 	$ b4 am -o/tmp 20210819195533.211756-1-hannes@cmpxchg.org --guess-base --guess-lookback 60

Thanks, will keep that --guess-lookback param in mind.

> I think the real question is why is someone sending a patch series that is
> based on a 2-month old tree? :)

Right :) The age also caused other issues so the author already promised
to rebase for v2.

Thanks!
