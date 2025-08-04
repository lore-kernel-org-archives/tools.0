Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36DA234966
	for <tools@linux.kernel.org>; Mon,  4 Aug 2025 18:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754333852; cv=none; b=gN1Kz+7zeV/tPhwqZZZKvyyIEWx5Dew7znI5Amnn5aN9wdabs/jxQqe+Ff8L2yhjX1U5YjvWQWP5gY+itzMZEsrt303azEFIEiUQW6IdCcNTX6rvw1wknGeqUWi2MeI4knWHInOBb/tpBSGLSh9XOc1+ymIAnDawmbZYomnlZkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754333852; c=relaxed/simple;
	bh=Y3y/+l21YdozLmh7Yv3fyk7tbjbQITBWSvpMvkm5cEI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=WnaPeWYWhYR4JEvmnMqv8858WRtxRBqbk+SWekzHs8gUtAhlP74FPHpa0RMdkEeegKYOCvUrvq8ZfV1XUp0JguXrZ5lAPmpuaAo4gEDfUS7tUP5rwM501SyhxiwGjzr9blHA0pfpyC+Td3AgJq3se5Dq+zZ/Sgi3I9OtTCc+F0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P8Xe9S+c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P8Xe9S+c"
Received: by smtp.kernel.org (Postfix)
	id 41621C4CEF0; Mon,  4 Aug 2025 18:57:32 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 790ABC4CEE7
	for <tools@kernel.org>; Mon,  4 Aug 2025 18:57:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 790ABC4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6154c7b3ee7so2298a12.0
        for <tools@kernel.org>; Mon, 04 Aug 2025 11:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754333850; x=1754938650; darn=kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Y3y/+l21YdozLmh7Yv3fyk7tbjbQITBWSvpMvkm5cEI=;
        b=P8Xe9S+cOBG3p4PqLKtueAcaGj1+2eQtmmHh2gqRP5zQhsWC1Aosz9jT6P09+lO2fe
         ezQe2wjXLOuBuHzeVpx3xtbQxSnEmsa/rFgq0jryCyqRv+NeHYLd0JOCxY+P4/EIUmF0
         J1PE52rFBI3iJQlTr7puTJ5kuaorp0xcXQGuPuKec74hAzKbHxKMDhJ1vSzAjzd6tesf
         PCO1JDtmqIms6jPNKJ0eNlbF+p3SpKIZ6i3QzIN1Dj9cay/jD1WCMqcReEr9hUTABKIw
         oFhhgD7NqCHfCSo+LHwZyxr9/xaKEz7lpjDFkuc75fqW5j8HFoFjrpWefyDN9DCNNNzS
         KdDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754333850; x=1754938650;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y3y/+l21YdozLmh7Yv3fyk7tbjbQITBWSvpMvkm5cEI=;
        b=QvDTRdYyUMQNJ+dhSu5rotZtCcmLbpATuTQL1BOzJIyJhpbj7lTzVIWwyXdGE69rPY
         9nLB3VNysQAIWBunaST2Z5sFcTOZ6j+/aM6udGosjzdsD+c2fryp/I90R3w1+0yuRNwQ
         x5UBSPOnl+fGewr6qhbed/b89BzZn7ziNjcXjIf4PtbHnzQql+g9FaXkRpAPnU/MwGA6
         Ln5knL9pHfWgVgE7biGp2WRejVF2Ta662cckg1tu5UoKV6Fd7aIAdJ1iGxna9c/rS9Uq
         oHQuhbxyK964TPwTJv77hOQXCQCxlMcWzSR7yYbV4AFPffNcP0/HmJNw0xedaecYXJu0
         xhzA==
X-Gm-Message-State: AOJu0Ywxy+vjTkj4ye12fMZLuDyVcvdwkZIulub65fL4vNods134rOjf
	UYlXjpzA0Akajatcm0aQuAto6Kbxn8rVkPuJllDc3N36LSNIywzJAs3LDfvQ2hbbJ7GNNQ0GSv4
	U7lszsQhxAlWRAifGPqlLe5FfN0GM+SOBNehD9wzMVWTDClEeuLIuD6dJzts=
X-Gm-Gg: ASbGnctIgE66zqNvJ4YsnHnPw8KBDv4eawOz7P/xSkIPzGt7Wyo+VLawzNPGRamq12S
	wd4n7YDXiYwkPEZsnf8QdX9+xTMRuEuD5DD5q9+u0VeXLgRah5csjueNdXNzlrXtnj/UqSpZ7uD
	u2+/1rAn9FVECh2oaeg5zgzqLMHi2lpl8s6lO3vKq2r0KsUa27JcjKUWBfOu9LzWT/DncO0LQLu
	NN36+Gd+Du0B0qHXBfZ7lsOdPbZ8YIEc0n2dPWrHpA7iAM=
X-Google-Smtp-Source: AGHT+IFkC8Uit2W3oHeSr6UcQOlgv8pv9txOjL8FaxOeMym0LiwoYcKNMXeq3r4Qdba5al3jLNz1x5h6Zf3rjR9EY2k=
X-Received: by 2002:a05:6402:2905:b0:615:2899:a4e5 with SMTP id
 4fb4d7f45d1cf-6177dbfa5cdmr3633a12.5.1754333849537; Mon, 04 Aug 2025 11:57:29
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
From: Jann Horn <jannh@google.com>
Date: Mon, 4 Aug 2025 20:56:52 +0200
X-Gm-Features: Ac12FXzt7BUgmehlPE7Ydz5p0ONMS2j60yduJB2qfHhkGMUmZBJGl67HKklq4HE
Message-ID: <CAG48ez2OSJd4ZSfan3Xn+=qM38Dbm8jhUBby8n1aRtYaTLQ26Q@mail.gmail.com>
Subject: b4 feature suggestion: rolestats in --auto-to-cc
To: tools@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi!

One thing I run into when I prepare patches for upstream Linux
submission with b4 is that "b4 prep --auto-to-cc" puts a list of
recipients in the patch, but does not include comments with the
rolestats that scripts/get_maintainer.pl is able to generate. When I'm
not familiar with the subsystem, this means that I effectively end up
redoing the work that --auto-to-cc did - I have to either format the
patches and then feed them into scripts/get_maintainer.pl or look
through MAINTAINERS in the hope of finding out who got added for what
reason, so that I can decide for myself if the recipient list is
sensible.

I think it would be nice if each line generated by --auto-to-cc was
accompanied by a comment saying which roles that person was selected
for.

Thanks for building b4!
