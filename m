Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBAC1C700A
	for <tools@linux.kernel.org>; Thu, 27 Mar 2025 20:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743106925; cv=none; b=K17euxgy/3lvIyjWjhjN6tBMViVOeygcsKWChgx6dNYzln7N9eUagyfePFT3fvYXlV0PoS1g/yYe+3ifqArnJ2ZKBKdDGwq7WzOMbF6V+U1YT7lmVAGCvAXgA8GGHCWTh14/JossJZDH0Rnnt/8sL9q+2YBvvDkB15TomCU+pKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743106925; c=relaxed/simple;
	bh=oYYbS5vNAfhKDs202fVEssH0BL47Zj3IQh73XTSyZFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TlgrAIhZ13OcM9i6IAHm3H6NQZSZ4H8BBuf2boWve/OReM3QoHkvEWRb3enwfJZq/D1+Fd8z+Vm7iZeJIffwNRTgdPgaw+pfvskMxAaqx0tLlgjugKvuncmbw4ZzNZfPIEDT6vtMfs20VycM3akcQYZNZ8YdNUxi5afhufI8srg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=VPnumHVM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="VPnumHVM"
Received: by smtp.kernel.org (Postfix)
	id 95F58C4CEEA; Thu, 27 Mar 2025 20:22:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47D39C4CEDD;
	Thu, 27 Mar 2025 20:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743106924;
	bh=oYYbS5vNAfhKDs202fVEssH0BL47Zj3IQh73XTSyZFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VPnumHVMLNYpLCv1iTLcNvhATuacWgdjtPDaMJsOhniug1CCpZmR0QnhJCggdzY2u
	 8IQ7/BV0a1kBeGspnewSbsqKWry16ftiw4eGIqeJZ51i1Ud9xsHRxFewMekmI0AkW8
	 pN16fYdILKZobzylGji5kf0xmBVjTztap9pd2a+0=
Date: Thu, 27 Mar 2025 16:22:03 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: tools@kernel.org
Subject: Re: [PATCH wotmate] Tweak trust path formatting for readability
Message-ID: <20250327-complex-peacock-of-infinity-9c0316@lemur>
References: <20250326-trust-paths-improvements-v1-1-21c6db48a29f@linuxfoundation.org>
 <3brmutov3nr5zvjc3zybr3fgibpv74ez7glb6gpqitz3qcbvnq@24mfzd6opz3s>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3brmutov3nr5zvjc3zybr3fgibpv74ez7glb6gpqitz3qcbvnq@24mfzd6opz3s>

On Wed, Mar 26, 2025 at 07:04:06PM +0100, Uwe Kleine-König wrote:
> > -        key_paths_repr = '\n'.join('\n `-> '.join(wotmate.get_uiddata_by_pubrow(c, rowid) if rowid != to_rowid else "." for rowid in kp) for kp in key_paths).encode('utf-8')
> > +        kpblock = ''
> > +        for kp in key_paths:
> > +            for lvl, rowid in enumerate(kp):
> > +                kpuid = wotmate.get_uiddata_by_pubrow(c, rowid)
> > +                kpblock += f'   {lvl}  {kpuid}' if lvl > 0 else f'from  {kpuid}'
> > +                kpblock += '\n'
> > +            kpblock += '\n'
> 
> Now this isn't a one-liner any more you can also work with indention as
> you proposed initially. Something like
> 
>                 kpblock += f'{4 * lvl * " "}`-> {kpuid}' if lvl > 0 else f'{kpuid}'
> 
> (untested).

I tried it and hated it. :)

> > +        key_paths_repr = kpblock.encode()
> 
> Did you drop 'utf-8' here on purpose?

Yes -- it's the default encoding when not specified (and it isn't affected by
the user locale setting). I can put that in explicitly if that makes it more
consistent or expected.

> >          # Do we already have a file in place?
> >          if os.path.exists(keyout):
> >              # Load it up and see if it's different
> >              with open(keyout, 'rb') as fin:
> >                  old_keyexport = fin.read()
> > -                if old_keyexport.find(keydata) > 0 and old_keyexport.find(key_paths_repr) > 0:
> > -                    logger.debug('No changes for %s', kid)
> > -                    continue
> > +                if keydata in old_keyexport:
> > +                    logger.debug('No key changes for %s', kid)
> > +                    if b'\n# Trust paths\n' not in old_keyexport:
> > +                        logger.debug('Old key does not include trust paths, skipping')
> > +                        continue
> > +                    if key_paths_repr in old_keyexport:
> > +                        logger.debug('No trust path changes for %s', kid)
> > +                        continue
> 
> I would add the trust path info already now in a commit changing all
> keys at once. Then we can benefit from it on the next real change of the
> data.

I don't want to do that for a number of reasons:

- this would trigger all keys to be reimported for anyone using
  the korg-refresh-keys
- this would make it harder to quickly judge when the key was last changed

One other possibility is to keep it out of the .asc file and to append this
data to the graph/ file instead, like so:

    ...
    </g>
    </svg>
    <!--
    Trust paths:

    from  Linus Torvalds <torvalds@kernel.org>
       1  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
       2  Kevin Hilman <khilman@kernel.org>
       3  Mattijs Korpershoek <mattijs.korpershoek@gmail.com>

    from  Linus Torvalds <torvalds@kernel.org>
       1  John Hawley ("Warthog9") <warthog9@eaglescrag.net>
       2  Ben Hutchings <bwh@kernel.org>
       3  Uwe Kleine-König <uwe@kleine-koenig.org>
       4  Mattijs Korpershoek <mattijs.korpershoek@gmail.com>

    -->

What do you think? I like this better, actually, because this will still show
the diffs as we want, but not touch the .asc files (which would trigger their
reimport on trust path changes not necessarily affecting that key).

What do you think?

-K
