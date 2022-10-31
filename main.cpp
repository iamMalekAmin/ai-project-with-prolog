
#include <bits/stdc++.h>
#include<vector>
  using namespace std;


struct node
{

int x1, y1;

int dist;

node ()
  {
  }
node (int x1, int y1, int dist):x1 (x1), y1 (y1), dist (dist)
  {

}
};




bool isFounded (int w, int r, int Nu)
{

if (w >= 1 && w <= Nu)

    {

if (r >= 1 && r <= Nu)

	{

return true;

}

}

return false;

}



int
minStepsToGetTarget (
int knPos[], int tarPos[],
int N, vector < pair < int,
		     int > >vect)
{

int xDirection[] = { -2, -1, 1, 2, -2, -1, 1, 2 };

int yDirection[] = { -1, -2, -2, -1, 1, 2, 2, 1 };


queue < node > q;


q.push (node (knPos[0], knPos[1], 0));


node t;

int x, y;

bool vis[N + 1][N + 1];


for (int i = 1; i <= N; i++)

for (int j = 1; j <= N; j++)

vis[i][j] = false;


vis[knPos[0]][knPos[1]] = true;


while (!q.empty ())
    {

t = q.front ();

q.pop ();


if (t.x1 == tarPos[0] && t.y1 == tarPos[1])

return t.dist;


for (int i = 0; i < 8; i++)
	{

x = t.x1 + xDirection[i];

y = t.y1 + yDirection[i];


if (isFounded (x, y, N) && !vis[x][y] && vect[i].first != x
		 && vect[i].second != y)
	    {

vis[x][y] = true;

q.push (node (x, y, t.dist + 1));

}

}

}

}



int
main ()
{

int N = 30, x, y, s, r;


cout << "enter knightPos x \n";

cin >> x;

cout << "enter knightPos y\n";

cin >> y;

int knPos[] = { x, y };

cout << "enter targetPos x \n";

cin >> s;

cerr << "enter targetPos y\n";

cin >> r;

int tarPos[] = { s, r };


vector < pair < int, int >>vect;


int ObstaclesN;

cout << "Enter number of Obstacles \n";

cin >> ObstaclesN;

int ObstaclesX[ObstaclesN], ObstaclesY[ObstaclesN];


for (int i = 0; i < ObstaclesN; i++)

    {

for (int j = 0; j < 1; j++)
	{

cout << "Enter Obstacle X \n";

cin >> ObstaclesX[i];

cout << "Enter Obstacle Y \n";

cin >> ObstaclesY[i];

}
}
int n = sizeof (ObstaclesX) / sizeof (ObstaclesX[0]);


for (int i = 0; i < n; i++)

vect.push_back (make_pair (ObstaclesX[i], ObstaclesY[i]));

    /* for (int i=0; i<n; i++)
       {
       cout << vect[i].first << " "
       << vect[i].second << endl;
       } */


cout << "minimum number of steps to target = ";

cout << minStepsToGetTarget (knPos, tarPos, N, vect);

return 0;

}
