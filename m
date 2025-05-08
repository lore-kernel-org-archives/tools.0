Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E902735976
	for <tools@linux.kernel.org>; Thu,  8 May 2025 20:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746734626; cv=none; b=bChwjNm9zM2E68RRIhfnlnjx2jpOO061h59Nypm5NHGH9RXupNyaDyOFshnEacSnKnZX4SWDyY9dPyk8/Qg3sGfVjiC3tJ6zak3VOBhp4rL3U1eU9iSJ8ef9QEvBU7PBusElVp8cBhioHUYenTH3FojVIfFs/ldkjvBimjB8u7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746734626; c=relaxed/simple;
	bh=3/n+i72zWZwye0pGG4IJN/dl0zatRT0u8X5ZUdurHqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DPXJjgtaIA9rlZitBUJ+ZPleTl3AlZIA/hrhU0clDZCbSCLvdgtxJ2BQ5fy07dXjjlLqKPpUC4ck+crnkQSIFa5ZPfs0YybqNH2GLoepDdp2hDW7FD3PXfrFayEOefDL3R8PWeNmMhiGE5c4/93ys4t/UAvzQoJM4xH6ls1o32A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Pn/qFoQs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Pn/qFoQs"
Received: by smtp.kernel.org (Postfix)
	id 6FB23C4CEEE; Thu,  8 May 2025 20:03:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34FA3C4CEE7;
	Thu,  8 May 2025 20:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746734625;
	bh=3/n+i72zWZwye0pGG4IJN/dl0zatRT0u8X5ZUdurHqI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pn/qFoQsIb9NjHwuTEaU6rUtd0rKUeILPzNO6TAvMrMk9FB72/cZBHQUe0qQyUM6+
	 sn4MXSgmLtp4qz6AOFtt4PJJjN6LAQMAZ930pAv55gQ9h1fF85wey9++UFVNjJHBuA
	 ztMrxyvJ8P6+5OU0CR9D/1+GFv6714IKyKi/n48o=
Date: Thu, 8 May 2025 16:03:41 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: tools@kernel.org
Subject: Re: [PATCH wotmate 1/3] Put a representation of the trust path in a
 txt file
Message-ID: <20250508-fresh-futuristic-shrew-5593b6@lemur>
References: <20250508094451.762484-5-u.kleine-koenig@baylibre.com>
 <20250508094451.762484-6-u.kleine-koenig@baylibre.com>
 <5hkczvc3idfnjjijgel6ntj342akxefa534dt3nfj2l2zb3pp6@xlq2cjzsp3rg>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5hkczvc3idfnjjijgel6ntj342akxefa534dt3nfj2l2zb3pp6@xlq2cjzsp3rg>

On Thu, May 08, 2025 at 05:29:12PM +0200, Uwe Kleine-König wrote:
> > diff --git a/make-sqlitedb.py b/make-sqlitedb.py
> > index fec199def51d..e8c5969f4d50 100755
> > --- a/make-sqlitedb.py
> > +++ b/make-sqlitedb.py
> > @@ -163,6 +163,11 @@ def keyring_load_sig_data(c, pub_keyid_rowid_map, uid_hash_rowid_map):
> >                  ignored_sigs += 1
> >                  continue
> >  
> > +            # skip SHA-1 based signatures
> > +            if fields[15] == "2":
> > +                ignored_sigs += 1
> > +                continue
> > +
> >              # do we have the key that signed it?
> >              if sigkeyid in pub_keyid_rowid_map.keys():
> >                  uidsigs[sigkeyid] = (
> 
> If you apply this patch, please drop this hunk. This was not supposed to
> be part of this patch. While I think doing this change is right, it
> should be done in a separate commit and well considered.

Okay. Can you respin as v2 with these changes?

-K
