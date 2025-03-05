Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E33155A21
	for <tools@linux.kernel.org>; Wed,  5 Mar 2025 16:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741193577; cv=none; b=IXGOHRyR8523gLXrMv6C7BdOMZw2Bgsj2jRrkBJXzjkv/QsgOhrxfJphMBg4Z4xJrTusj73/KVG6dtK591v59ultuJt65Uerzn5fWVze87iDzt9ODdHvT7wcvhdBbUGi8URQPuYosf4gAM/lvhWmKnsOBvJWMeDTH8cA4C6Pa5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741193577; c=relaxed/simple;
	bh=T86v4oRzrXAS/ZHrRJ1yX7uY6s1AfQoc9smXUng2uME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nH5zJjznjTJkiQuH1U3ov6RuikVLWECDfgL4C2LVAa1LnfyyMcUeKJkrifRNg0jJhb5hCecRONYiDUTDfpJASq8LezkTYypYtyb0lDsRzDo/rjzGqcgQK5iuJVbTaIQ9+vTkfwddVg62cjV5fF4IfUwWfuPOTMx51wN6W8QBqtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=nE619rrI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="nE619rrI"
Received: by smtp.kernel.org (Postfix)
	id 58814C4CEE2; Wed,  5 Mar 2025 16:52:57 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2D151C4CED1
	for <tools@kernel.org>; Wed,  5 Mar 2025 16:52:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2D151C4CED1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6f679788fd1so50407377b3.2
        for <tools@kernel.org>; Wed, 05 Mar 2025 08:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1741193575; x=1741798375; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2OUuVmCt1ZsxAsvOY8EoDzg4RDX28Y8xD0jf/aw7TBI=;
        b=nE619rrIEyvb6Rvb3Y2j+JcyRPm2XX164O7+SCAL2pPIo5JSl9sGDjH3rGuIy54HGc
         WBa/yyO3QrZJtDn0oOiIjdwEv1GIVwV+I3MLAvgnP6yXDCHIEL3TqGXw7BhNFwuTpVzF
         BnXf2UvgAaW8Zp2/3n6U8uydxW44dfRi3c9DY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741193575; x=1741798375;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2OUuVmCt1ZsxAsvOY8EoDzg4RDX28Y8xD0jf/aw7TBI=;
        b=PFJRqNNiH0GKXB3MhV8cX+jjob4h3Z9AGgPqDN4L2oUuo0FCNMn/WDzDUA6AwVpOiF
         yLL8esmCRl2uvLu+7zpJpMBhl4ZhFbuxHLL3FmTfuv0/rWbV0mvO93HbR7Ze4BUBhgiI
         feA0+4nE7GHr0d6XGLog3VAgGVZjSFuWJjdoZYAS1SBLeCs/J4cgf1K4f7F5DHd00/fz
         wQ4+5K2oo+c5wKRtQtvrnVNS6GBSY7fuc4mviIK9HFadd77Nzc0zVoWj/HWDnj6JS0Rm
         pwzC4LysoL3Kx3fnvnL/J7ji4clTAO2mQXLl8hSu6xKHbEhyvYbJ5EWO0nqZGQt/FWkf
         QcUg==
X-Gm-Message-State: AOJu0YwhfpZuMzoHd9RqwjUvCCCrcrEtloysyIUvssFnjesx5J94eBMn
	dh7Znu4iUFyokbGDQWcwur7OA6qdFc4NbM+nYhu3NceP57UpeT38hsTuqEh+R1WzDl22kHRCFYc
	6ZMk=
X-Gm-Gg: ASbGncv+V7UcCa7KL8QCSIDSzzuIKX01UNpT1g3AlCG4UTJXHegQd2PBdpNG9pN5g4T
	S+u9VTVpDx7pWdpK1fkjTBNADC7atiipwmwkq0jcNCGB39C1kuMy+Zd9V7vQEI7zvGowjQhZ6NU
	bHrkNhQ2b+WW1vKpc0cB8LsfRv9ji/0PjiDxk4aGPXzKqxaSutWi97+DTvC48kR6AmDb+oO/h0I
	ZxmRo0mUS/rXHGnLzNzACZ4S7m/V+xdsgUdQVWP/rhFhv8eaIHZOppfcs93enERuoKsLYbmjo3C
	+EchAWannS9j9irebPQ0jzDLINsp8jvkz4oKRH/BDJjuvw==
X-Google-Smtp-Source: AGHT+IE/mxs6Qlp8Pz8s8y37KiDVTe2O75uJBL9cieyy1CPW2+zIGqazz7mMwd4JTfap7kM+Pw9Shw==
X-Received: by 2002:a05:690c:6112:b0:6fb:b8a1:d3bb with SMTP id 00721157ae682-6fda303f3a0mr58764317b3.17.1741193574796;
        Wed, 05 Mar 2025 08:52:54 -0800 (PST)
Received: from bill-the-cat ([187.192.142.234])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6fd3ca0f49esm29671747b3.2.2025.03.05.08.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 08:52:54 -0800 (PST)
Date: Wed, 5 Mar 2025 10:52:51 -0600
From: Tom Rini <trini@konsulko.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: b4 feature request
Message-ID: <20250305165251.GU2640854@bill-the-cat>
References: <20250305145121.GM2640854@bill-the-cat>
 <20250305-amiable-banana-scallop-167f8a@lemur>
 <20250305152549.GN2640854@bill-the-cat>
 <20250305154059.GO2640854@bill-the-cat>
 <20250305-diamond-hummingbird-of-unity-a0d9e1@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305-diamond-hummingbird-of-unity-a0d9e1@lemur>
X-Clacks-Overhead: GNU Terry Pratchett

On Wed, Mar 05, 2025 at 11:44:56AM -0500, Konstantin Ryabitsev wrote:
> On Wed, Mar 05, 2025 at 09:40:59AM -0600, Tom Rini wrote:
> > I found the template, and did a diff, and I don't see why my partial
> > replies are different.
> 
> It's the commented-out ${summary}.
> 
> >  # Check this page for info on convenient URL shorteners:
> >  # https://korg.wiki.kernel.org/userdoc/git-url-shorterners
> > -#${summary}
> > +${summary}

Ah, OK. I had skipped that at the time on purpose, but let me put it
back and see how it reads.

Note that the template files still point to the wiki and not korg.docs
like the b4 docs page does (and there's not an exact redirect).

So just some small tweaks and thank again for the help!

-- 
Tom
