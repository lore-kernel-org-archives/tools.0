Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5044142A79B
	for <tools@linux.kernel.org>; Wed,  8 Jul 2026 16:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783527383; cv=none; b=jJAsIzuLMzzllJOhEwnQMLXgl+AvgtvAUkaqsukBi1ArLA9OsXn3hEn5C7BuTY1ZdG0OTIHBeFn4ZqtzwCZP8AAdxS5b686HoJLKpXpYKDIADj7PBOKoumebYLaZSEwLP83cYnDOYUYwVWiYK0cUX45FUZklde0E2TsaVhVCxDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783527383; c=relaxed/simple;
	bh=IV57HNdktZ/UxgfXGPNYQHEzlcBIkLUMZaYYfWoLPqI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LX0HJTFwp7SpXDEmvQ0XlFNb/fZqD5AsYq/HsCv/znOW50JZsSd3xXuuEtgBtmsefNLPBALNNPsZe2/zk+1iMxh0F3ZRXoZVxczFDB2CZzDjkM9cBqC6/0oOZv6QQCd4+rk/5JXOCX1VYlYcqjUA7aPcbyBrWKG529ClKZ7HXdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UoWMkXaA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UoWMkXaA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46F8A1F000E9;
	Wed,  8 Jul 2026 16:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783527380;
	bh=M8g+YOYJHRgDBNU7QIyDM+EBOEIbkxAX/X2xnD0Rosk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=UoWMkXaARDFd3AFt9YYNYGhcBlFg/tXZ0K4V9G0poPNba4X174JY7VpUsyvJrwuwG
	 UdY7BdGFY7q4nZwGsb/5MN3hkKRs5RSnLhl8rtwLmLzPd7qx+0Aw8TG4OfUBVgguvO
	 OxsNKXN3CrHsDstOS/itaJYO10wAar3ZvdFHymDVIlD2R2gi0FzbsQnfNtEHeFrxit
	 eEYix5F9RmIC9muzMfpVk7YDg3qT9fqLeQQvgeMJYp1ea6GrIYG9RbAPfeS+4+s/gS
	 s0nDrl4MUUVEES70JqNkdDsXf2S/yTZ6DobW9ENcvAq1hrpmJok9Sh7irmSCkUOVIN
	 e8wJfkT1Erqxg==
Message-ID: <916a7ec4-cf10-42ee-9624-18e13ff35ed4@kernel.org>
Date: Wed, 8 Jul 2026 18:16:18 +0200
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: possible fuzziness for b4 trailers -u?
Content-Language: en-US
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: tools@linux.kernel.org
References: <b0e433ff-fa15-4715-ae0a-7f23da217d51@kernel.org>
 <20260618-wooden-dragon-of-devotion-bcece2@meerkat>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <20260618-wooden-dragon-of-devotion-bcece2@meerkat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/18/26 20:30, Konstantin Ryabitsev wrote:
> On Thu, Jun 18, 2026 at 10:50:52AM +0200, Vlastimil Babka (SUSE) wrote:
>> I sometimes run b4 trailers -u to collect tags on patches that have been
>> meanwhile slightly modified in git since the posting. Sometimes it's on the
>> b4/$cover_topic branch as a submitter, sometimes it's already applied (but
>> not stable as in no history rewrite) on a maintainer tree branch (I do use
>> --since-commit and doublecheck the result of the update closely since some
>> past surprises...).
>> 
>> AFAICS the trailers update relies only patch-id (?) so it will miss the tags
>> when patch-id changes due to these local modifications. Could it try some
>> fuzzy matching in that case? Some ideas:
>> 
>> - in b4/$cover_topic branch the metadata allows finding the posting thread
>> and matching the patch subject
>>   - ok, subject can sometimes change too, but not so often as the code
>> 
>> - in maintainer tree branch, there's usually a patch.msgid.link Link: that
>> can lead to the given patch rather deterministically.
> 
> This was actually easier than I'd thought, because we already did the bulk of
> this logic for "b4 dig". The latest master has a new --fuzzy flag to `b4
> trailers`, which you can also couple with the new --interactive flag, which
> should let you review the trailers before you actually apply them.
> 
> Try it out and let me know if this is what you were looking for.

Just used it successfully, thanks a lot! The --interactive flag will also be
very useful.

> Cheers,
> -K

