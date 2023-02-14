Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF262569
	for <tools@linux.kernel.org>; Tue, 14 Feb 2023 14:40:43 +0000 (UTC)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31EDC0MT018345;
	Tue, 14 Feb 2023 14:40:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=pp1;
 bh=ml6At9qdI6YIt125/Gd06scUBfGUeMCn7Y6INqeqvow=;
 b=CMpumKxIsTEcjw34lsx7R7sntaEIuQIfdNvW16PCvN7hREG9RqEyY9XvOoOFhxhwpLCv
 odjV+0cq8G7276m3G17URahR99Instl6t3x1GMCjp9ML1ECOOqOV4sCeAkMme1kAGrw3
 L1B3Gec/yf1cvtHae1Xt8YTC+sToqZrt6HyA535gAwIGzDy0A4YCXEAKIV0+Gmqy6VIj
 vcFT3TDXYN6QQ5/Rg6rftZ1lcJ8sC8vrLAYm4vcTJOuw/hreWINUZ3HLi9oh+YFGoyv5
 WsZs1Jk94mCMjLfYNLmyE28PDkxBwsH6SGP/nssRV5OrMppMSOVbSZX9SZUuwl0AP2+a MQ== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nrayfb4t2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Feb 2023 14:40:38 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
	by ppma04wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31ED45GT020606;
	Tue, 14 Feb 2023 14:40:37 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([9.208.130.101])
	by ppma04wdc.us.ibm.com (PPS) with ESMTPS id 3np2n704d1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Feb 2023 14:40:37 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31EEeadw52232650
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Feb 2023 14:40:37 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DF0F65805E;
	Tue, 14 Feb 2023 14:40:36 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C310658055;
	Tue, 14 Feb 2023 14:40:36 +0000 (GMT)
Received: from localhost (unknown [9.211.96.43])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 14 Feb 2023 14:40:36 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: tools@linux.kernel.org
Cc: Michael Ellerman <mpe@ellerman.id.au>
Subject: b4 submission endpoint sender name length
Date: Tue, 14 Feb 2023 08:40:36 -0600
Message-ID: <877cwk9uor.fsf@linux.ibm.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: iQBKsz-Vr8Lc5Zcw-UR1tmroaSt2BcVx
X-Proofpoint-ORIG-GUID: iQBKsz-Vr8Lc5Zcw-UR1tmroaSt2BcVx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-14_07,2023-02-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 mlxlogscore=796 malwarescore=0
 mlxscore=0 spamscore=0 phishscore=0 impostorscore=0 clxscore=1011
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302140125

Hello!

I've used b4 v0.12/v0.12.1 to submit kernel work to linuxppc-dev over
the last couple weeks and it's working very well for me. I have been
using the web submission endpoint.

When I checked with the powerpc maintainer (cc'd) to see if my new
workflow was causing any issues for him, the only less-than-positive
feedback I got was that the sender name set by the endpoint:

  Nathan Lynch via B4 Submission Endpoint

feels a bit long and sticks out in the patchwork UI. Could this be
shortened? Perhaps "via B4 web" or similar?
